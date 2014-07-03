//
//  UIView+Activity.m
//  HBR
//
//  Created by Hugues Bernet-Rollande on 1/16/13.
//  Copyright (c) 2013 HBR. All rights reserved.
//

#import "UIView+Activity.h"
#import "NSObject+AssociatedObject.h"
#import "UIActivityIndicatorView+Start.h"

#define kAssociatedActivityIndicatorViewKey "AssociatedActivityIndicatorViewKey"
#define kAssociatedUserInteractionBackupKey "AssociatedUserInteractionBackupKey"

@implementation UIView (Activity)

- (void)startActivityIndicator;
{
    [self startActivityIndicatorWithActivityIndicatorStyle:kUIViewActivityIndicatorViewStyle];
}

- (void)startActivityIndicatorWithActivityIndicatorStyle:(UIActivityIndicatorViewStyle)style;
{
    [self startActivityIndicatorWithActivityIndicatorStyle:style frame:self.bounds];
}

- (void)startActivityIndicatorWithActivityIndicatorStyle:(UIActivityIndicatorViewStyle)style frame:(CGRect)frame;
{
    UIActivityIndicatorView *spinner = [self associatedObjectforKey:kAssociatedActivityIndicatorViewKey];
    if(spinner == nil) {
        spinner = [UIActivityIndicatorView activityIndicatorStartedWithActivityIndicatorStyle:style];
        [self setAssociatedObject:spinner forKey:kAssociatedActivityIndicatorViewKey];
    }
    if([spinner superview] == nil)
        [self addSubview:spinner];
    spinner.frame = frame;
}

- (void)startActivityIndicatorAndDisableUserInteraction;
{
    [self startActivityIndicator];
    [self setAssociatedObject:@(self.userInteractionEnabled) forKey:kAssociatedUserInteractionBackupKey];
    self.userInteractionEnabled = NO;
    if([self isKindOfClass:[UIControl class]]){
        [(UIControl *)self setEnabled:NO];
    }
}

- (void)stopActivityIndicator;
{
    UIActivityIndicatorView *spinner = [self associatedObjectforKey:kAssociatedActivityIndicatorViewKey];
    [spinner stopAnimating];
    [spinner removeFromSuperview];
    [self setAssociatedObject:nil forKey:kAssociatedActivityIndicatorViewKey];
    
    NSNumber *userInteractionEnabled = [self associatedObjectforKey:kAssociatedUserInteractionBackupKey];
    if(userInteractionEnabled){
        self.userInteractionEnabled = [userInteractionEnabled boolValue];
        if([self isKindOfClass:[UIControl class]]){
            [(UIControl *)self setEnabled:self.userInteractionEnabled];
        }
    }
}

@end
