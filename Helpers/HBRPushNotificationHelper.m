//
//  YDPushNotificationHelper.m
//  Yerdle
//
//  Created by Hugues Bernet-Rollande on 4/12/13.
//  Copyright (c) 2013 Comcast Silicon Valley. All rights reserved.
//

#import "HBRPushNotificationHelper.h"
#import "NSURL+QueryArguments.h"

@implementation HBRPushNotificationHelper

+ (void)init
{
    [[NSUserDefaults standardUserDefaults] registerDefaults:@{
                                                              kSettingKeyShouldTryToRegisterForPushNotification: @(NO),
                                                              kSettingKeyShouldPromptForPushNotification: @(YES)
                                                              }];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (BOOL)shouldTryToRegister;
{
    BOOL shouldTryToRegister = [[NSUserDefaults standardUserDefaults] boolForKey:kSettingKeyShouldTryToRegisterForPushNotification];
    if([self hasRegisteredNotifications]) {
        shouldTryToRegister = YES;
        [self setShouldTryToRegister:YES];
    }
    NSTrack(@"push notification: should try to register: %@", shouldTryToRegister ? @"YES": @"NO");
    return shouldTryToRegister;
}

+ (BOOL)hasRegisteredNotifications
{
    BOOL hasRegistered = NO;
    if ([[UIApplication sharedApplication] respondsToSelector:@selector(currentUserNotificationSettings)]) {
        UIUserNotificationSettings *settings = [[UIApplication sharedApplication] currentUserNotificationSettings];
        hasRegistered = (settings.types != UIUserNotificationTypeNone);
    } else {
        hasRegistered = ([[UIApplication sharedApplication] enabledRemoteNotificationTypes] != UIRemoteNotificationTypeNone);
    }
    return hasRegistered;
}

+ (void)setShouldTryToRegister:(BOOL)shouldTryToRegister;
{
    [[NSUserDefaults standardUserDefaults] setBool:shouldTryToRegister forKey:kSettingKeyShouldTryToRegisterForPushNotification];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (BOOL)shouldPrompt;
{
    if([self shouldTryToRegister]) return NO; // never prompt if we already authorize
    
    // prompt count
    NSInteger count = [[NSUserDefaults standardUserDefaults] integerForKey:kSettingKeyPushNotificationPromptCount];
    NSTrack(@"push notification: prompt count: %ld", (long)count);
    if(count > kPushNotificationMaxPrompt) return NO;
    
    // prompt if never prompt or last prompt was more than kTimeIntervalBeforeAskForNotificationAgain ago
    BOOL shouldPrompt = [[NSUserDefaults standardUserDefaults] boolForKey:kSettingKeyShouldPromptForPushNotification];
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:kSettingKeyShouldPromptForPushNotification];
    [[NSUserDefaults standardUserDefaults] synchronize];
    if(shouldPrompt == NO){
        NSDate *date = [[NSUserDefaults standardUserDefaults] objectForKey:kSettingKeyLastPromptForPushNotification];
        NSTrack(@"push notification: last prompt: %@", date);
        NSTimeInterval timeIntervalSinceLastPrompt = [[NSDate date] timeIntervalSinceDate:date];
        if(!date || timeIntervalSinceLastPrompt > kAppTimeIntervalBeforeAskForPushNotificationAgain)
            shouldPrompt = YES;
    }
    
    if(shouldPrompt == YES) {
        [self rememberPrompt];
    }
    
    return shouldPrompt;
}

+ (void)rememberPrompt;
{
    [self rememberLastPromptDate];
    [self incrementPromptCount];
}

+ (void)resetPrompt;
{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:kSettingKeyPushNotificationPromptCount];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:kSettingKeyLastPromptForPushNotification];
}

+ (void)rememberLastPromptDate;
{
    // increment counter
    NSInteger count = [[NSUserDefaults standardUserDefaults] integerForKey:kSettingKeyPushNotificationPromptCount];
    [[NSUserDefaults standardUserDefaults] setInteger:count + 1 forKey:kSettingKeyPushNotificationPromptCount];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (void)incrementPromptCount;
{
    [[NSUserDefaults standardUserDefaults] setObject:[NSDate date] forKey:kSettingKeyLastPromptForPushNotification];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (void)handleNotification:(NSDictionary *)aps
{
    NSTrack(@"push notification: handling notification: %@", aps);
    
    // silent notification
    if(aps[@"s"]) return;
    
    void (^deeplink)() = ^{
        [[UIApplication sharedApplication].delegate application:[UIApplication sharedApplication] openURL:[aps[@"u"] urlValue] sourceApplication:nil annotation:nil];
    };
    
    if ([UIApplication sharedApplication].applicationState == UIApplicationStateInactive ) {
        //The application received the notification from an inactive state, i.e. the user tapped the "View" button for the alert.
        if([aps[@"u"] safeValue]) deeplink();
    }
    
    if([UIApplication sharedApplication].applicationState == UIApplicationStateActive ) {
        //        //The application received a notification in the active state, so you can display an alert view or do something appropriate.
        
        UIAlertView *alertView = [UIAlertView bk_alertViewWithTitle:NSLocalizedString(@"Notification", @"Notification Helper Notification Title") message:aps[@"alert"]];
        [alertView bk_setCancelButtonWithTitle:NSLocalizedString(@"Dismiss", @"Notification Helper Notification Dismiss") handler:nil];
        if([aps[@"u"] safeValue]) {
            NSString *buttonLabel = NSLocalizedString(@"Show", @"Notification Helper Deeplink Show");
            if (aps[@"a"]) {
                buttonLabel = NSLocalizedString(aps[@"a"], @"Notification Helper Deeplink Custom Label");
            }
            [alertView bk_addButtonWithTitle:buttonLabel handler:deeplink];
        }
        [alertView show];
    }
}

+ (BOOL)prompt;
{
    return [self promptWithMessage:NSLocalizedString(@"Would you like us to send notification about the app", @"Notification Helper Prompt Message")];
}

+ (BOOL)promptWithMessage:(NSString *)message;
{
    BOOL should = [HBRPushNotificationHelper shouldPrompt];
    if(should) [self doPromptWithMessage:message];
    return should;
}

+ (void)doPromptWithMessage:(NSString *)message;
{
    UIAlertView *alertView = [UIAlertView bk_alertViewWithTitle:NSLocalizedString(@"Notifications", @"Notification Helper Prompt Title") message:message];
    [alertView bk_setCancelButtonWithTitle:NSLocalizedString(@"Maybe later", @"Notification Helper Prompt Later")   handler:nil];
    [alertView bk_addButtonWithTitle:NSLocalizedString(@"Let's do it!", @"Notification Helper Prompt Do it") handler:^{
        [HBRPushNotificationHelper registerNotification];
    }];
    [alertView show];
}

+ (void)registerNotification;
{
    [self setShouldTryToRegister:YES];
    [self registerNotificationUnlessNeverAsked];
}

+ (void)registerNotificationUnlessNeverAsked;
{
    if([self shouldTryToRegister]) {
        [[UAPush shared] setPushEnabled:YES];
        //        [[UAPush shared] registerForRemoteNotificationTypes:kPushNotificationRegisterTypes];
    }
}

+ (void)setAlias:(NSString *)newAlias
{
    [UAPush shared].alias = newAlias;
    [[UAPush shared] updateRegistration];
}

@end
