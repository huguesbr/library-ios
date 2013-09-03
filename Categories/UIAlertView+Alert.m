//
//  UIAlertView+Alert.m
//  HBR
//
//  Created by Hugues Bernet-Rollande on 12/20/12.
//  Copyright (c) 2012 HBR. All rights reserved.
//

#import "UIAlertView+Alert.h"
#import <UIAlertView+BlocksKit.h>


@implementation UIAlertView (Alert)

+ (id)alertViewWithTitle:(NSString *)title message:(NSString *)message dismissButtonTitle:(NSString *)dismissButtonTitle actionButtonTitle:(NSString *)actionButtonTitle action:( void(^)(NSString *inputText) )actionBlock;
{
    UIAlertView *alertView = [[self class] alertViewWithTitle:title message:message];
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

+ (id)showAlertViewWithTitle:(NSString *)title message:(NSString *)message dismissButtonTitle:(NSString *)dismissButtonTitle actionButtonTitle:(NSString *)actionButtonTitle action:( void(^)() )actionBlock;
{
    id alertView = [self alertViewWithTitle:title message:message dismissButtonTitle:dismissButtonTitle actionButtonTitle:actionButtonTitle action:^(NSString *input){
        if(actionBlock) actionBlock();
    }];
    [alertView show];
    return alertView;
}

+ (id)showAlertViewWithTitle:(NSString *)title message:(NSString *)message dismissButtonTitle:(NSString *)dismissButtonTitle;
{
    return [self showAlertViewWithTitle:title message:message dismissButtonTitle:dismissButtonTitle actionButtonTitle:nil action:nil];
}

+ (id)showAlertViewWithTitle:(NSString *)title message:(NSString *)message;
{
    return [self showAlertViewWithTitle:title message:message dismissButtonTitle:kUIAlertDefaultCancelButtonTitle];
}

+ (id)showAlertViewWithTitle:(NSString *)title;
{
    return [self showAlertViewWithTitle:title message:nil dismissButtonTitle:kUIAlertDefaultCancelButtonTitle];
}

@end
