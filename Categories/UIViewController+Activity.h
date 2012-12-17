//
//  UIViewController+ActivityIndicator.h
//  Muse
//
//  Created by Hugues on 8/10/12.
//  Copyright (c) 2012 Comcast Silicon Valley. All rights reserved.
//

/*
 Add convenient methods to display an activity indicator from any controller.
 If controller is in a navigationController, display the indicator in top right bar button
 Otherwise display the activity indicator in the middle of the controller view
 */

#import <UIKit/UIKit.h>

@interface UIViewController (Activity)

@property (strong, nonatomic) UIActivityIndicatorView *activityIndicatorView;
@property (strong, nonatomic) UIBarButtonItem *backupBarButtonItem;

- (void)showActivityIndicatorInNavigationItem:(UINavigationItem *)navigationItem;
- (void)showActivityIndicatorInView:(UIView *)view;
- (void)showActivityIndicator;
- (void)hideActivityIndicator;

@end
