//
//  UIAlertView+Alert.h
//  HBR
//
//  Created by Hugues Bernet-Rollande on 12/20/12.
//  Copyright (c) 2012 HBR. All rights reserved.
//

#import <UIKit/UIKit.h>

#ifndef kUIAlertDefaultCancelButtonTitle
#define kUIAlertDefaultCancelButtonTitle @"Dismiss"
#endif

@interface UIAlertView (Alert)

+ (id)alertViewWithTitle:(NSString *)title message:(NSString *)message dismissButtonTitle:(NSString *)dismissButtonTitle actionButtonTitle:(NSString *)actionButtonTitle action:( void(^)(NSString *inputText) )actionBlock;

+ (id)showAlertViewWithTitle:(NSString *)title message:(NSString *)message dismissButtonTitle:(NSString *)dismissButtonTitle actionButtonTitle:(NSString *)actionButtonTitle action:( void(^)() )actionBlock;

+ (id)showAlertViewWithTitle:(NSString *)title message:(NSString *)message dismissButtonTitle:(NSString *)dismissButtonTitle;

+ (id)showAlertViewWithTitle:(NSString *)title message:(NSString *)message;

+ (id)showAlertViewWithTitle:(NSString *)title;

@end
