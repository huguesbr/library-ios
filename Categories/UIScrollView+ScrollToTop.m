//
//  UIScrollView+ScrollToTop.m
//  yerdle
//
//  Created by Hugues Bernet-Rollande on 4/5/14.
//  Copyright (c) 2014 Yerdle. All rights reserved.
//

#import "UIScrollView+ScrollToTop.h"

@implementation UIScrollView (ScrollToTop)
- (void)scrollToTopAnimated:(BOOL)animated;
{
    [self scrollRectToVisible:CGRectMake(0, 0, self.bounds.size.width, 44) animated:animated];
}
@end
