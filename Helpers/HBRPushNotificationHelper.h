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
#define kSettingKeyPushNotificationPromptCount                  @"SettingKeyPushNotificationPromptCount"
#ifndef kAppTimeIntervalBeforeAskForPushNotificationAgain
#define kAppTimeIntervalBeforeAskForPushNotificationAgain       3600 * 24 * 7 // ask every week
#endif
#ifndef kPushNotificationMaxPrompt
#define kPushNotificationMaxPrompt                              3 // user will be ask max 3
#endif
#ifndef kPushNotificationRegisterTypes
#define kPushNotificationRegisterTypes  (UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound | UIRemoteNotificationTypeAlert)
#endif

@interface HBRPushNotificationHelper : NSObject

+ (BOOL)shouldPrompt;
+ (void)prompt;
+ (void)promptWithMessage:(NSString *)message;
+ (void)doPromptWithMessage:(NSString *)message;
+ (void)handleNotification:(NSDictionary *)aps;
+ (void)registerNotification;
+ (void)registerNotificationUnlessNeverAsked;
+ (void)setAlias:(NSString *)newAlias;
+ (BOOL)shouldTryToRegister;
+ (void)rememberLastPromptDate;
+ (void)incrementPromptCount;

@end
