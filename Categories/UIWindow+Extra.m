//
//  UIWindow+Extra.m
//  yerdle2
//
//  Created by Hugues Bernet-Rollande on 8/4/13.
//  Copyright (c) 2013 Yerdle. All rights reserved.
//

#import "UIWindow+Extra.h"

@implementation UIWindow (Extra)
- (UIViewController *)topController;
{
    UIViewController *topController = self.rootViewController;
    while (topController.presentedViewController) {
        topController = topController.presentedViewController;
    }
    
    return topController;
}
@end
