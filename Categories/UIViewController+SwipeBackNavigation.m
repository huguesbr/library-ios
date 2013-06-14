//
//  UIViewController+SwipeBackNavigation.m
//  HBR
//
//  Created by Hugues Bernet-Rollande on 1/21/13.
//  Copyright (c) 2013 HBR. All rights reserved.
//

#import "UIViewController+SwipeBackNavigation.h"
#import "NSObject+WeakSelf.h"

@implementation UIViewController (SwipeBackNavigation)

- (void)addSwipeBackGestureRecognizer;
{
    [self addSwipeBackGestureRecognizerToView:self.view];
}

- (void)addSwipeBackGestureRecognizerToView:(UIView *)view;
{
    if(self.navigationController) {
        WeakifySelf(weakSelf)
        UISwipeGestureRecognizer *backSwipeGesture = [[UISwipeGestureRecognizer alloc] initWithHandler:^(UIGestureRecognizer *sender, UIGestureRecognizerState state, CGPoint location) {
            [weakSelf.navigationController popViewControllerAnimated:YES];
        }];
        backSwipeGesture.direction = UISwipeGestureRecognizerDirectionRight;
        [view addGestureRecognizer:backSwipeGesture];
    }
}

@end
