//
//  YDPushNotificationHelper.m
//  Yerdle
//
//  Created by Hugues Bernet-Rollande on 4/12/13.
//  Copyright (c) 2013 Comcast Silicon Valley. All rights reserved.
//

#import "YDPushNotificationHelper.h"

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
}

+ (BOOL)shouldPrompt;
{
    if([self shouldTryToRegister]) return NO; // never prompt if we already authorize
    
    // prompt if never prompt or last prompt was more than kTimeIntervalBeforeAskForNotificationAgain ago
    BOOL shouldPrompt = [[NSUserDefaults standardUserDefaults] boolForKey:kSettingKeyShouldPromptForPushNotification];
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:kSettingKeyShouldPromptForPushNotification];
    if(shouldPrompt == NO){
        NSDate *date = [[NSUserDefaults standardUserDefaults] objectForKey:kSettingKeyLastPromptForPushNotification];
        NSTimeInterval timeIntervalSinceLastPrompt = [[NSDate date] timeIntervalSinceDate:date];
        if(!date || timeIntervalSinceLastPrompt > kAppTimeIntervalBeforeAskForPushNotificationAgain)
            shouldPrompt = YES;
    }
    if(shouldPrompt == YES) // remember last prompt time
        [[NSUserDefaults standardUserDefaults] setObject:[NSDate date] forKey:kSettingKeyLastPromptForPushNotification];
    
    return shouldPrompt;
}

+ (void)showNotification:(NSDictionary *)aps
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Notification", @"Notification Helper Notification Title")
                                                    message:aps[@"message"]
                                                   delegate:nil
                                          cancelButtonTitle:NSLocalizedString(@"Dismiss", @"Notification Helper Notification Dismiss")
                                          otherButtonTitles:nil];
    [alert show];
}

+ (void)prompt;
{
    if([YDPushNotificationHelper shouldPrompt]) {
        [UIAlertView showAlertViewWithTitle:NSLocalizedString(@"Notifications", @"Notification Helper Prompt Title") message:NSLocalizedString(@"Would you like to receive notifications from yerdle about your items?", @"Notification Helper Prompt Message") cancelButtonTitle:NSLocalizedString(@"Maybe later", @"Notification Helper Prompt Later")  otherButtonTitles:@[NSLocalizedString(@"Let's do it!", @"Notification Helper Prompt Do it")] handler:^(UIAlertView *alertView, NSInteger buttonIndex) {
            if(buttonIndex){
                [YDPushNotificationHelper registerNotification];
            }
        }];
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
