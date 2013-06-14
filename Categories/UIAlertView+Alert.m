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

+ (void)showAlertViewWithTitle:(NSString *)title message:(NSString *)message dismissButtonTitle:(NSString *)dismissButtonTitle;
{
    [[[[self class] alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:dismissButtonTitle otherButtonTitles:nil] show];
}

+ (void)showAlertViewWithTitle:(NSString *)title message:(NSString *)message;
{
    [[[[self class] alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:kUIAlertDefaultCancelButtonTitle otherButtonTitles:nil] show];
}

+ (void)showAlertViewWithTitle:(NSString *)title;
{
    [[[[self class] alloc] initWithTitle:title message:nil delegate:nil cancelButtonTitle:kUIAlertDefaultCancelButtonTitle otherButtonTitles:nil] show];
}

@end
