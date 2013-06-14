//
//  UIApplication+TopController.m
//  Yerdle XP 01
//
//  Created by Hugues Bernet-Rollande on 4/24/13.
//  Copyright (c) 2013 Hugues Bernet-Rollande. All rights reserved.
//

#import "UIApplication+TopController.h"

@implementation UIApplication (TopController)

- (UIViewController*) topController;
{
    UIViewController *topController = [UIApplication sharedApplication].keyWindow.rootViewController;
    
    while (topController.presentedViewController) {
        topController = topController.presentedViewController;
    }
    
    return topController;
}

@end
