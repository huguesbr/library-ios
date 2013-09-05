//
//  YDPushNotificationHelper.m
//  Yerdle
//
//  Created by Hugues Bernet-Rollande on 4/12/13.
//  Copyright (c) 2013 Comcast Silicon Valley. All rights reserved.
//

#import "YDPushNotificationHelper.h"
#import "NSURL+QueryArguments.h"

@implementation YDPushNotificationHelper

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
    return [[NSUserDefaults standardUserDefaults] boolForKey:kSettingKeyShouldTryToRegisterForPushNotification];
}

+ (void)setShouldTryToRegister:(BOOL)shouldTryToRegister;
{
    [[NSUserDefaults standardUserDefaults] setBool:shouldTryToRegister forKey:kSettingKeyShouldTryToRegisterForPushNotification];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (BOOL)shouldPrompt;
{
    if([self shouldTryToRegister]) return NO; // never prompt if we already authorize
    
    // prompt if never prompt or last prompt was more than kTimeIntervalBeforeAskForNotificationAgain ago
    BOOL shouldPrompt = [[NSUserDefaults standardUserDefaults] boolForKey:kSettingKeyShouldPromptForPushNotification];
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:kSettingKeyShouldPromptForPushNotification];
//    shouldPrompt = YES;
    if(shouldPrompt == NO){
        NSDate *date = [[NSUserDefaults standardUserDefaults] objectForKey:kSettingKeyLastPromptForPushNotification];
        NSTimeInterval timeIntervalSinceLastPrompt = [[NSDate date] timeIntervalSinceDate:date];
        if(!date || timeIntervalSinceLastPrompt > kAppTimeIntervalBeforeAskForPushNotificationAgain)
            shouldPrompt = YES;
    }
    if(shouldPrompt == YES) // remember last prompt time
        [[NSUserDefaults standardUserDefaults] setObject:[NSDate date] forKey:kSettingKeyLastPromptForPushNotification];
    
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    return shouldPrompt;
}

+ (void)handleNotification:(NSDictionary *)aps
{
    NSLog(@"handling notification: %@", aps);
    
    // silent notification
    if(aps[@"s"]) return;
    
    void (^deeplink)() = ^{
        [[UIApplication sharedApplication].delegate application:[UIApplication sharedApplication] openURL:[aps[@"u"] urlValue] sourceApplication:nil annotation:nil];
    };
    
    if ([UIApplication sharedApplication].applicationState == UIApplicationStateInactive ) {
        //The application received the notification from an inactive state, i.e. the user tapped the "View" button for the alert.
        if(aps[@"u"]) deeplink();
    }
    
    if([UIApplication sharedApplication].applicationState == UIApplicationStateActive ) {
        //        //The application received a notification in the active state, so you can display an alert view or do something appropriate.
        
        UIAlertView *alertView = [UIAlertView alertViewWithTitle:NSLocalizedString(@"Notification", @"Notification Helper Notification Title") message:aps[@"alert"]];
        [alertView setCancelButtonWithTitle:NSLocalizedString(@"Dismiss", @"Notification Helper Notification Dismiss") handler:nil];
        if(aps[@"u"]) {
            NSString *buttonLabel = NSLocalizedString(@"Show", @"Notification Helper Deeplink Show");
            if (aps[@"a"]) {
                buttonLabel = NSLocalizedString(aps[@"a"], @"Notification Helper Deeplink Custom Label");
            }
            [alertView addButtonWithTitle:buttonLabel handler:deeplink];
        }
        [alertView show];
    }
}

+ (void)prompt;
{
    [self promptWithMessage:NSLocalizedString(@"Would you like us to notify you about activity on your items?", @"Notification Helper Prompt Message")];
}

+ (void)promptWithMessage:(NSString *)message;
{
    if([YDPushNotificationHelper shouldPrompt]) {
        UIAlertView *alertView = [UIAlertView alertViewWithTitle:NSLocalizedString(@"Notifications", @"Notification Helper Prompt Title") message:message];
        [alertView setCancelButtonWithTitle:NSLocalizedString(@"Maybe later", @"Notification Helper Prompt Later")   handler:nil];
        [alertView addButtonWithTitle:NSLocalizedString(@"Let's do it!", @"Notification Helper Prompt Do it") handler:^{
            [YDPushNotificationHelper registerNotification];
        }];
        [alertView show];
    }
}

+ (void)registerNotification;
{
    [self setShouldTryToRegister:YES];
    [self registerNotificationUnlessNeverAsked];
}

+ (void)registerNotificationUnlessNeverAsked;
{
    if([self shouldTryToRegister])
        [[UAPush shared] registerForRemoteNotificationTypes:kPushNotificationRegisterTypes];
}

+ (void)setAlias:(NSString *)newAlias
{
    [UAPush shared].alias = newAlias;
    [[UAPush shared] updateRegistration];
}

@end
