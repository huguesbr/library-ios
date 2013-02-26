//
//  UIViewController+ActivityIndicator.m
//  Muse
//
//  Created by Hugues on 8/10/12.
//  Copyright (c) 2012 Comcast Silicon Valley. All rights reserved.
//

#import "UIViewController+Activity.h"
#import "NSObject+AssociatedObject.h"

#ifdef kUIActivityIndicatorViewDefaultStyle
#define kUINavBarActivityIndicatorViewDefaultStyle kUIActivityIndicatorViewDefaultStyle
#define kUIViewActivityIndicatorViewDefaultStyle kUIActivityIndicatorViewDefaultStyle
#endif

#ifndef kUINavBarActivityIndicatorViewDefaultStyle
#define kUINavBarActivityIndicatorViewDefaultStyle UIActivityIndicatorViewStyleWhite
#endif

#ifndef kUIViewActivityIndicatorViewDefaultStyle
#define kUIViewActivityIndicatorViewDefaultStyle UIActivityIndicatorViewStyleGray
#endif

#define kAssociatedActivityIndicatorKey "AssociatedActivityIndicatorKey"
#define kAssociatedBackupNavigationItemKey "AssociatedBackupNavigationItemKey"

@implementation UIViewController (Activity)

- (UIActivityIndicatorView *)activityIndicatorView
{
    UIActivityIndicatorView *activityIndicator = [self associatedObjectforKey:kAssociatedActivityIndicatorKey];
    if(!activityIndicator){
        activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:kUINavBarActivityIndicatorViewDefaultStyle];
        [self setAssociatedObject:activityIndicator forKey:kAssociatedActivityIndicatorKey];
    }
    return activityIndicator;
}

- (void)setActivityIndicatorView:(UIActivityIndicatorView *)activityIndicatorView
{
    /// IMPORTANT, need to fix this, this imply controller that use an activity view should always set it to nil when dealloc,
    // or does ios do it for you?
    [self setAssociatedObject:activityIndicatorView forKey:kAssociatedActivityIndicatorKey];
}

- (UIBarButtonItem *)backupBarButtonItem
{
    return [self associatedObjectforKey:kAssociatedBackupNavigationItemKey];
}

- (void)setBackupBarButtonItem:(UIBarButtonItem *)backupBarButtonItem
{
    [self setAssociatedObject:backupBarButtonItem forKey:kAssociatedBackupNavigationItemKey];
}

- (void)showActivityIndicatorInNavigationItem:(UINavigationItem *)navigationItem;
{
    self.backupBarButtonItem = navigationItem.rightBarButtonItem;
    
    navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.activityIndicatorView];
    [self.activityIndicatorView startAnimating];
}

- (void)showActivityIndicatorInView:(UIView *)view;
{
    self.activityIndicatorView.center = CGPointMake(view.bounds.size.width / 2, view.bounds.size.height / 2);
    [view addSubview:self.activityIndicatorView];
    [self.activityIndicatorView startAnimating];
}

- (void)showActivityIndicator;
{
    if (!self.navigationController.navigationBarHidden)
        [self showActivityIndicatorInNavigationItem:self.navigationItem];
    else
        [self showActivityIndicatorInView:self.view];
}

- (void)hideActivityIndicator;
{
    [self.activityIndicatorView removeFromSuperview];
    [self.activityIndicatorView stopAnimating];
    
    if(self.backupBarButtonItem) self.navigationItem.rightBarButtonItem = self.backupBarButtonItem;
    self.backupBarButtonItem = nil;
}

@end
