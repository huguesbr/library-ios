//
//  UIView+firstResponder.m
//  HBR
//
//  Created by Hugues Bernet-Rollande on 1/16/13.
//  Copyright (c) 2013 HBR. All rights reserved.
//

#import "UIView+firstResponder.h"

@implementation UIView (firstResponder)

- (UIView *)firstResponder
{
    if (self.isFirstResponder) {
        return self;
    }
    
    for (UIView *subView in self.subviews) {
        UIView *firstResponder = [subView firstResponder];
        
        if (firstResponder != nil) {
            return firstResponder;
        }
    }
    
    return nil;
}

@end
