//
//  UIView+Subviews.h
//  OneDebit
//
//  Created by Hugues Bernet-Rollande on 1/22/13.
//  Copyright (c) 2013 OneDebit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (RecursiveSubviews)

- (void)enumerateRecursiveSubviewsUsingBlock:(void (^)(UIView *subview, NSInteger level, BOOL *stop))block;
- (void)recursiveDescription;

@end
