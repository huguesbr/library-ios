//
//  UIAlertView+Alert.h
//  OneDebit
//
//  Created by Hugues Bernet-Rollande on 12/20/12.
//  Copyright (c) 2012 OneDebit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertView (Alert)

+ (void)showAlertViewWithTitle:(NSString *)title message:(NSString *)message dismissButtonTitle:(NSString *)dismissButtonTitle;

+ (void)showAlertViewWithTitle:(NSString *)title message:(NSString *)message;

+ (void)showAlertViewWithTitle:(NSString *)title;

@end
