//
//  UIColor+Variance.m
//  yerdle
//
//  Created by Hugues Bernet-Rollande on 5/14/14.
//  Copyright (c) 2014 Yerdle. All rights reserved.
//

#import "UIColor+Variance.h"

@implementation UIColor (Variance)

- (UIColor *)lighterColorWithDelta:(CGFloat)delta;
{
    CGFloat r, g, b, a;
    if ([self getRed:&r green:&g blue:&b alpha:&a])
        return [UIColor colorWithRed:MIN(r + delta, 1.0)
                               green:MIN(g + delta, 1.0)
                                blue:MIN(b + delta, 1.0)
                               alpha:a];
    return nil;
}

- (UIColor *)darkerColorWithDelta:(CGFloat)delta;
{
    return [self lighterColorWithDelta:-delta];
}

@end
