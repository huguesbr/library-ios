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
    [self startActivityIndicatorWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
}

- (void)startActivityIndicatorWithActivityIndicatorStyle:(UIActivityIndicatorViewStyle)style;
{
    UIActivityIndicatorView *spinner = [UIActivityIndicatorView activityIndicatorStartedWithActivityIndicatorStyle:style];
    spinner.frame = self.bounds;
    [self addSubview:spinner];
    [self setAssociatedObject:spinner forKey:kAssociatedActivityIndicatorViewKey];
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
