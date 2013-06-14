//
//  UIViewController+DebugGesture.m
//  HBR
//
//  Created by Hugues Bernet-Rollande on 1/21/13.
//  Copyright (c) 2013 HBR. All rights reserved.
//

#import "UIViewController+DebugGesture.h"

@implementation UIViewController (DebugGesture)

- (void)addDebugGestureRecognizerWithHandler:(void (^)())handler;
{
    [self addDebugGestureRecognizerWithHandler:handler toView:self.view];
}

- (void)addDebugGestureRecognizerWithHandler:(void (^)())handler toView:(UIView *)view;
{
#if DEBUG
    UIPinchGestureRecognizer *debugGestureRecognizer = [[UIPinchGestureRecognizer alloc] initWithHandler:^(UIGestureRecognizer *sender, UIGestureRecognizerState state, CGPoint location) {
        if(state == UIGestureRecognizerStateEnded) {
            if(handler) handler();
        }
    }];
    [view addGestureRecognizer:debugGestureRecognizer];
#endif
}

@end
