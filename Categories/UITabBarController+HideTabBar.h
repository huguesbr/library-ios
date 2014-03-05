//
//  UITabBarController+HideTabBar.h
//  yerdle
//
//  Created by Hugues Bernet-Rollande on 3/5/14.
//  Copyright (c) 2014 Yerdle. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBarController (HideTabBar)

@property (nonatomic, getter=isTabBarHidden) BOOL tabBarHidden;

- (void)setTabBarHidden:(BOOL)hidden animated:(BOOL)animated;

@end
