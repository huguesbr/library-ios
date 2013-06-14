//
//  UIView+Activity.h
//  HBR
//
//  Created by Hugues Bernet-Rollande on 1/16/13.
//  Copyright (c) 2013 HBR. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Activity)

- (void)startActivityIndicator;
- (void)startActivityIndicatorWithActivityIndicatorStyle:(UIActivityIndicatorViewStyle)style;
- (void)startActivityIndicatorAndDisableUserInteraction;
- (void)stopActivityIndicator;

@end
