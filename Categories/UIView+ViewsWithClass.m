//
//  UIView+ViewsWithClass.m
//  yerdle
//
//  Created by Hugues Bernet-Rollande on 4/16/14.
//  Copyright (c) 2014 Yerdle. All rights reserved.
//

#import "UIView+ViewsWithClass.h"

@implementation UIView (ViewsWithClass)

- (NSArray *)subviewsWithClass:(Class)aClass;
{
    NSMutableArray *subviews = [@[] mutableCopy];
    [[self subviews] enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if([obj isKindOfClass:aClass])
            [subviews addObject:obj];
    }];
    return subviews;
}

@end
