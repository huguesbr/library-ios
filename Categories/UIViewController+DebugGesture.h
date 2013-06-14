//
//  UIViewController+DebugGesture.h
//  HBR
//
//  Created by Hugues Bernet-Rollande on 1/21/13.
//  Copyright (c) 2013 HBR. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (DebugGesture)

- (void)addDebugGestureRecognizerWithHandler:(void (^)())handler;
- (void)addDebugGestureRecognizerWithHandler:(void (^)())handler toView:(UIView *)view;

@end
