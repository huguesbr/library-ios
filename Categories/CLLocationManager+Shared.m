//
//  CLLocationManager+Shared.m
//  HBR
//
//  Created by Hugues Bernet-Rollande on 12/19/12.
//  Copyright (c) 2012 HBR. All rights reserved.
//

#import "CLLocationManager+Shared.h"

@implementation CLLocationManager (Shared)

+ (CLLocationManager *)sharedManager;
{
    static CLLocationManager *_sharedManager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedManager = [[CLLocationManager alloc] init];
    });
    return _sharedManager;
}

@end
