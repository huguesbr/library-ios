//
//  HBRCLLocationManager.h
//  HBR
//
//  Created by Hugues Bernet-Rollande on 12/19/12.
//  Copyright (c) 2012 HBR. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    HBRLocationManagerPromptForLocationNever = 0,
    HBRLocationManagerPromptForLocationSkip = 1,
    HBRLocationManagerPromptForLocationAlways = 2
} HBRLocationManagerPromptForLocation;

typedef void (^locationUpdateBlock)(NSArray *locations);
typedef void (^locationFailureBlock)(NSError *error);

@interface HBRLocationManager : NSObject <CLLocationManagerDelegate>

@property (strong) CLLocation *lastLocation;
@property (assign, nonatomic) HBRLocationManagerPromptForLocation promptForLocation;

- (id)initWithLocationUpdateBlock:(locationUpdateBlock)locationUpdateBlock failureBlock:(locationFailureBlock)failureBlock;

- (void)startUpdatingLocation;

- (void)stopUpdatingLocation;

- (void)updateLocationWithSuccess:(locationUpdateBlock)locationUpdateBlock failure:(locationFailureBlock)failureBlock;

- (void)performSuccess:( void (^) (CLLocation *location) )block failure:( void (^) () )failureBlock prompt:(BOOL)prompt;

+ (HBRLocationManager *)sharedManager;

@end
