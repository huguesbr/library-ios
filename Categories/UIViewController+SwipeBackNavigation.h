//
//  UIViewController+SwipeBackNavigation.h
//  OneDebit
//
//  Created by Hugues Bernet-Rollande on 1/21/13.
//  Copyright (c) 2013 OneDebit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (SwipeBackNavigation)

- (void)addSwipeBackGestureRecognizer;
- (void)addSwipeBackGestureRecognizerToView:(UIView *)view;

@end
