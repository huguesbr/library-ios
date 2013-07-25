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

#define kSettingKeyShouldTryToRegisterForPushNotification       @"SettingKeyShouldTryToRegisterForPushNotification"
#define kSettingKeyShouldPromptForPushNotification              @"SettingKeyShouldPromptForPushNotification"
#define kSettingKeyLastPromptForPushNotification                @"SettingKeyLastPromptForPushNotification"
#ifndef kAppTimeIntervalBeforeAskForPushNotificationAgain
#define kAppTimeIntervalBeforeAskForPushNotificationAgain       3600 * 24 * 7 // ask every week
#endif
#ifndef kPushNotificationRegisterTypes
#define kPushNotificationRegisterTypes  (UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound | UIRemoteNotificationTypeAlert)
#endif

@interface YDPushNotificationHelper : NSObject

+ (BOOL)shouldPrompt;
+ (void)prompt;
+ (void)showNotification:(NSDictionary *)aps;
+ (void)registerNotification;
+ (void)registerNotificationUnlessNeverAsked;
+ (void)setAlias:(NSString *)newAlias;

@end
