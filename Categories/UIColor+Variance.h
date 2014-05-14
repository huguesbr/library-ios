//
//  UIColor+Variance.h
//  yerdle
//
//  Created by Hugues Bernet-Rollande on 5/14/14.
//  Copyright (c) 2014 Yerdle. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Variance)
- (UIColor *)lighterColorWithDelta:(CGFloat)delta;
- (UIColor *)darkerColorWithDelta:(CGFloat)delta;
@end
