//
//  YDPushNotificationHelper.h
//  Yerdle
//
//  Created by Hugues Bernet-Rollande on 4/12/13.
//  Copyright (c) 2013 Comcast Silicon Valley. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UrbanAirship-iOS-SDK/UAPush.h>
#import <UrbanAirship-iOS-SDK/UAirship.h>

@interface YDPushNotificationHelper : NSObject

+ (BOOL)shouldPrompt;
+ (void)prompt;
+ (void)showNotification:(NSDictionary *)aps;
+ (void)registerNotification;
+ (void)registerNotificationUnlessNeverAsked;

@end
