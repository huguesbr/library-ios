//
//  CLLocation+Extra.m
//  yerdle2
//
//  Created by Hugues Bernet-Rollande on 8/6/13.
//  Copyright (c) 2013 Yerdle. All rights reserved.
//

#import "CLLocation+Extra.h"
#import "NSObject+AssociatedObject.h"

#define kCLLocationReverseLocation "CLLocationReverseLocation"
#define kCLLocationLastLocationUserDefaultKey @"CLLocationLastLocationUserDefaultKey"

@interface CLLocation ()
@end

@implementation CLLocation (Extra)

static CLLocation *_lastLocation = nil;

+ (CLLocation *)lastLocation;
{
    CLLocation *lastLocation = _lastLocation;
    if(!lastLocation) {
        NSMutableDictionary *lastLocationDict = [[NSUserDefaults standardUserDefaults] objectForKey:kCLLocationLastLocationUserDefaultKey];
        if(lastLocationDict) {
            CLLocation *location = [[CLLocation alloc] initWithLatitude:[lastLocationDict[@"latitude"] floatValue] longitude:[lastLocationDict[@"longitude"] floatValue]];
            if(lastLocationDict[@"reverseLocation"])
                [location setReverseLocation:lastLocationDict[@"reverseLocation"]];
            _lastLocation = location;
        }
    }
    return _lastLocation;
}

- (void)saveAsLastLocation;
{
    _lastLocation = self;
    
    
    // Alternative [[NSUserDefaults standardUserDefaults] setObject:[NSKeyedArchiver archivedDataWithRootObject:location] forKey:@"someKey"];
    // But wont' save reverseLocation
    NSMutableDictionary *lastLocationDict = [@{} mutableCopy];
    lastLocationDict[@"latitude"] = @(self.coordinate.latitude);
    lastLocationDict[@"longitude"] = @(self.coordinate.longitude);
    if([self reverseLocation])
        lastLocationDict[@"reverseLocation"] = [self reverseLocation];
    
    [[NSUserDefaults standardUserDefaults] setObject:lastLocationDict forKey:kCLLocationLastLocationUserDefaultKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)setReverseLocation:(NSString *)reverseLocation
{
    [self setAssociatedObject:reverseLocation forKey:kCLLocationReverseLocation];
}

- (NSString *)reverseLocation
{
    NSString *reverseLocation = [self associatedObjectforKey:kCLLocationReverseLocation];
    if(!reverseLocation) {
        // hacky
//        [[DMLocationManager shared] o]
        reverseLocation = @"";
        //        rev
//        [[DMLocationManager shared] obtainAddressFromLocation:location completition:^(CLPlacemark *placemark, NSString *address, NSString *locality, NSArray *otherPlacemarks, NSError *error) {
//            kLastLocationDisplay = placemark ? [NSString stringWithFormat:k$(@"%@, %@"), placemark.locality, placemark.administrativeArea] : k$(@"");
//            //                [Settings setObject:location forKey:@"lastLocation"];
//            [self hideBlockingAlert];
//            if(completionBlock) completionBlock(YES);
//        }];
    }
    return reverseLocation;
}

@end
