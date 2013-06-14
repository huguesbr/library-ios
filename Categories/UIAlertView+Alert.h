//
//  UIAlertView+Alert.h
//  HBR
//
//  Created by Hugues Bernet-Rollande on 12/20/12.
//  Copyright (c) 2012 HBR. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertView (Alert)

+ (void)showAlertViewWithTitle:(NSString *)title message:(NSString *)message dismissButtonTitle:(NSString *)dismissButtonTitle;

+ (void)showAlertViewWithTitle:(NSString *)title message:(NSString *)message;

+ (void)showAlertViewWithTitle:(NSString *)title;

@end
