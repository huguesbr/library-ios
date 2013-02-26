//
//  UIView+Activity.h
//  OneDebit
//
//  Created by Hugues Bernet-Rollande on 1/16/13.
//  Copyright (c) 2013 OneDebit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Activity)

- (void)startActivityIndicator;
- (void)startActivityIndicatorAndDisableUserInteraction;
- (void)stopActivityIndicator;

@end
