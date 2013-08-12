//
//  UIScrollView+Autosize.m
//  yerdle2
//
//  Created by Hugues Bernet-Rollande on 7/31/13.
//  Copyright (c) 2013 Yerdle. All rights reserved.
//

#import "UIScrollView+Autosize.h"

@implementation UIScrollView (Autosize)
- (void)autosize;
{
    __block CGSize maxSize = CGSizeMake(0, 0);
    [[self subviews] enumerateObjectsUsingBlock:^(UIView *scrollSubview, NSUInteger idx, BOOL *stop) {
        if (scrollSubview.isHidden) return;
        if (CGRectGetMaxY(scrollSubview.frame) > maxSize.height)
            maxSize.height = CGRectGetMaxY(scrollSubview.frame);
        if (CGRectGetMaxX(scrollSubview.frame) > maxSize.width)
            maxSize.width = CGRectGetMaxX(scrollSubview.frame);
    }];
    NSLog(@"update scrollview content size %@", NSStringFromCGSize(maxSize));
    [self setContentSize:maxSize];
}
@end
