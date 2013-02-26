//
//  UIView+Activity.m
//  OneDebit
//
//  Created by Hugues Bernet-Rollande on 1/16/13.
//  Copyright (c) 2013 OneDebit. All rights reserved.
//

#import "UIView+Activity.h"

#define kAssociatedActivityIndicatorViewKey "AssociatedActivityIndicatorViewKey"

@implementation UIView (Activity)

- (void)startActivityIndicator;
{
    UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [spinner startAnimating];
    spinner.frame = self.bounds;
    // store userInteraction flag in spinner tag to restore when stopping activity indicator
    spinner.tag = self.userInteractionEnabled;
    [self addSubview:spinner];
}

- (void)startActivityIndicatorAndDisableUserInteraction;
{
    [self startActivityIndicator];
    self.userInteractionEnabled = NO;
}

- (void)stopActivityIndicator;
{
    [self.subviews enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if([obj isKindOfClass:[UIActivityIndicatorView class]]){
            self.userInteractionEnabled = [obj tag];
            [obj stopAnimating];
            [obj removeFromSuperview];
        }
    }];
}

@end
