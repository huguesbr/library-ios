//
//  UIAlertView+Alert.m
//  HBR
//
//  Created by Hugues Bernet-Rollande on 12/20/12.
//  Copyright (c) 2012 HBR. All rights reserved.
//

#import "UIAlertView+Alert.h"
#import <UIAlertView+BlocksKit.h>

#ifndef kUIAlertDefaultCancelButtonTitle
#define kUIAlertDefaultCancelButtonTitle @"Dismiss"
#endif

@implementation UIAlertView (Alert)

+ (UIAlertView *)alertViewWithTitle:(NSString *)title message:(NSString *)message dismissButtonTitle:(NSString *)dismissButtonTitle actionButtonTitle:(NSString *)actionButtonTitle action:( void(^)(NSString *inputText) )actionBlock;
{
    UIAlertView *alertView = [UIAlertView alertViewWithTitle:title message:message];
    if([dismissButtonTitle isEqualToString:@""]) dismissButtonTitle = kUIAlertDefaultCancelButtonTitle;
    if(dismissButtonTitle) [alertView setCancelButtonWithTitle:dismissButtonTitle handler:nil];
    if(actionButtonTitle) {
        Weakify(alertView) weakAlertView = alertView;
        [alertView addButtonWithTitle:actionButtonTitle handler:^{
            if(actionBlock) {
                if (weakAlertView.alertViewStyle == UIAlertViewStylePlainTextInput)
                    actionBlock([[weakAlertView textFieldAtIndex:0] text]);
                else
                    actionBlock(nil);
            }
        }];
    }
    return alertView;
}

+ (void)showAlertViewWithTitle:(NSString *)title message:(NSString *)message dismissButtonTitle:(NSString *)dismissButtonTitle actionButtonTitle:(NSString *)actionButtonTitle action:( void(^)() )actionBlock;
{
    [[self alertViewWithTitle:title message:message dismissButtonTitle:dismissButtonTitle actionButtonTitle:actionButtonTitle action:^(NSString *input){
        if(actionBlock) actionBlock();
    }] show];
}

+ (void)showAlertViewWithTitle:(NSString *)title message:(NSString *)message dismissButtonTitle:(NSString *)dismissButtonTitle;
{
    [self showAlertViewWithTitle:title message:message dismissButtonTitle:dismissButtonTitle actionButtonTitle:nil action:nil];
}

+ (void)showAlertViewWithTitle:(NSString *)title message:(NSString *)message;
{
    [self showAlertViewWithTitle:title message:message dismissButtonTitle:kUIAlertDefaultCancelButtonTitle];
}

+ (void)showAlertViewWithTitle:(NSString *)title;
{
    [self showAlertViewWithTitle:title message:nil dismissButtonTitle:kUIAlertDefaultCancelButtonTitle];
}

@end
