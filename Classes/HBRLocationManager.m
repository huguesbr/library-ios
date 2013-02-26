//
//  HBRCLLocationManager.m
//  OneDebit
//
//  Created by Hugues Bernet-Rollande on 12/19/12.
//  Copyright (c) 2012 OneDebit. All rights reserved.
//

#import "HBRLocationManager.h"
#import "NSArray+FirstObject.h"

@interface HBRLocationManager()

@property (strong) CLLocationManager *locationManager;
@property (strong) locationUpdateBlock updateBlock;
@property (strong) locationFailureBlock failureBlock;
@property (strong) NSMutableArray *updateOnceBlocks;
@property (strong) NSMutableArray *failureOnceBlocks;

@end

@implementation HBRLocationManager

- (id)init
{
    self = [super init];
    if(self){
        self.locationManager = [[CLLocationManager alloc] init];
//        self.locationManager = nil;
        self.locationManager.delegate = self;
        [self reset];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reset) name:UIApplicationDidEnterBackgroundNotification object:nil];
    }
    return self;
}

- (void)reset
{
    self.updateOnceBlocks = [@[] mutableCopy];
    self.failureOnceBlocks = [@[] mutableCopy];
    self.locationManager.delegate = self;
    self.lastLocation = nil;
    self.promptForLocation = [[self class] promptForLocation];
}

- (id)initWithLocationUpdateBlock:(locationUpdateBlock)locationUpdateBlock failureBlock:(locationFailureBlock)failureBlock;
{
    self = [self init];
    if(self){
        self.updateBlock = [locationUpdateBlock copy];
        self.failureBlock = [failureBlock copy];
    }
    return self;
}

- (void)updateLocationWithSuccess:(locationUpdateBlock)locationUpdateBlock failure:(locationFailureBlock)failureBlock;
{
    if(locationUpdateBlock){
        [self.updateOnceBlocks addObject:[locationUpdateBlock copy]];
    }
    if(failureBlock){
        [self.failureOnceBlocks addObject:[failureBlock copy]];
    }
    [self startUpdatingLocation];
}

- (void)startUpdatingLocation;
{
    [self.locationManager startUpdatingLocation];
}

- (void)stopUpdatingLocation;
{
    [self.locationManager stopUpdatingLocation];
}

-(HBRLocationManagerPromptForLocation)promptForLocation
{
    HBRLocationManagerPromptForLocation prompt = [[self class] promptForLocation] & _promptForLocation;
    return prompt;
}

- (void)performSuccess:( void (^) (CLLocation *) )block failure:( void (^) () )failureBlock prompt:(BOOL)prompt
{
    __block BOOL _prompt = prompt;
    if(self.lastLocation){
        if(block) block(self.lastLocation);
    } else {
        void (^promptService) () = ^{
            if (prompt && self.promptForLocation != HBRLocationManagerPromptForLocationNever) {
                // only once per session
                self.promptForLocation = HBRLocationManagerPromptForLocationNever;
                [self startUpdatingLocation];
//                [HBRAlertView showAlertViewWithTitle:@"Geolocation" message:@"In order to find deal around you enable location service" cancelButtonTitle:nil otherButtonTitles:@[@"Show me", @"Don't ask again", @"Dimiss"] handler:^(UIAlertView *alertView, NSInteger buttonIndex) {
//                    switch (buttonIndex) {
//                        case 0:
//                            [self startUpdatingLocation];
////                            [HBRAlertView showAlertViewWithTitle:@"" message:[$ @"Settings / Privacy / Location : On\n%@ : On", [UIApplication sharedApplication].name]];
//                            break;
//                        case 1:
//                            // disable always
//                            [[self class] setPromptForLocation:HBRLocationManagerPromptForLocationNever];
//                            break;
//                            
//                        default:
//                            break;
//                    }
//                }];
                if (failureBlock) failureBlock();
            }
            _prompt = NO;
        };
        
        if([CLLocationManager locationServicesEnabled] == NO) {
            promptService();
            return;
        }
        
        switch ([CLLocationManager authorizationStatus]) {
            case kCLAuthorizationStatusNotDetermined:
                // The user has not yet made a choice regarding whether this application can use location services.
                break;
            case kCLAuthorizationStatusRestricted:
                // This application is not authorized to use location services. The user cannot change this application’s status, possibly due to active restrictions such as parental controls being in place.
                break;
            case kCLAuthorizationStatusDenied:
                // The user explicitly denied the use of location services for this application or location services are currently disabled in Settings.
                promptService();
                return;
                break;
            case kCLAuthorizationStatusAuthorized:
                //
                break;
                
            default:
                break;
        }
        
        // prompt is override by askForLocation
        switch (self.promptForLocation) {
            case HBRLocationManagerPromptForLocationNever:
                break;
            case HBRLocationManagerPromptForLocationAlways:
            {
                // skip until restart, ask only once per session
                self.promptForLocation = HBRLocationManagerPromptForLocationSkip;
                [HBRAlertView showAlertViewWithTitle:@"Geolocation" message:@"In order to find deal around you, \nwe would like you to share your your location" cancelButtonTitle:nil otherButtonTitles:@[@"Share always", @"Share this time only", @"Never ask again", @"Not this time"] handler:^(UIAlertView *alertView, NSInteger buttonIndex) {
                    switch (buttonIndex) {
                        case 0: // Share always
                        {
                            [self updateLocationWithSuccess:^(NSArray *locations) {
                                if (block) block ([locations firstObject]);
                            } failure:^(NSError *error) {
                                [[TKAlertCenter defaultCenter] postAlertWithMessage:@"Unable to determine your location" image:[UIImage imageNamed:@"alert-ico"]];
                                if (failureBlock) failureBlock();
                            }];
                            // Always skip now
                            [HBRLocationManager setPromptForLocation:HBRLocationManagerPromptForLocationSkip];
                        }
                            break;
                        case 1: // Share this time only
                        {
                            [self updateLocationWithSuccess:^(NSArray *locations) {
                                if (block) block ([locations firstObject]);
                            } failure:^(NSError *error) {
                                [[TKAlertCenter defaultCenter] postAlertWithMessage:@"Unable to determine your location" image:[UIImage imageNamed:@"alert-ico"]];
                                if (failureBlock) failureBlock();
                            }];
                        }
                            break;
                        case 2: // Never ask again
                            [[self class] setPromptForLocation:HBRLocationManagerPromptForLocationNever];
                            if (failureBlock) failureBlock();
                            break;
                        case 3: // Not this time
                            if (failureBlock) failureBlock();
                            break;
                            
                        default:
                            break;
                    }
                }];
            }
                break;
            case HBRLocationManagerPromptForLocationSkip:
            {
                [self updateLocationWithSuccess:^(NSArray *locations) {
                    if (block) block ([locations firstObject]);
                } failure:^(NSError *error) {
                    if (failureBlock) failureBlock();
                }];
            }
                break;
                
            default:
                break;
        }
    }
    
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - CLLocationManagerDelegate

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    self.lastLocation = [locations firstObject];
    if(self.updateBlock){
        self.updateBlock(locations);
    } else {
        for (locationUpdateBlock block in self.updateOnceBlocks) {
            block(locations);
        }
        [self.updateOnceBlocks removeAllObjects];
        [self.locationManager stopUpdatingLocation];
    }
}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    if (self.failureBlock) {
        self.failureBlock(error);
    } else {
    for (locationFailureBlock block in self.failureOnceBlocks) {
        block(error);
    }
    [self.failureOnceBlocks removeAllObjects];
}
    [self.locationManager stopUpdatingLocation];
}

#pragma mark - Singleton

#define kHBRLocationManagerAskForLocation @"kHBRLocationManagerAskForLocation"

+ (HBRLocationManager *)sharedManager;
{
    static HBRLocationManager *_sharedManager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [[NSUserDefaults standardUserDefaults] registerDefaults:@{kHBRLocationManagerAskForLocation: @(HBRLocationManagerPromptForLocationAlways)}];
        _sharedManager = [[HBRLocationManager alloc] init];
    });
    return _sharedManager;
}

+ (HBRLocationManagerPromptForLocation)promptForLocation
{
    HBRLocationManagerPromptForLocation prompt = [[NSUserDefaults standardUserDefaults] integerForKey:kHBRLocationManagerAskForLocation];
    return prompt;
}

+ (void)setPromptForLocation:(HBRLocationManagerPromptForLocation)promptForLocation
{
    [[NSUserDefaults standardUserDefaults] setInteger:promptForLocation forKey:kHBRLocationManagerAskForLocation];
}

@end
