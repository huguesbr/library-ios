//
//  UIView+Subviews.m
//  OneDebit
//
//  Created by Hugues Bernet-Rollande on 1/22/13.
//  Copyright (c) 2013 OneDebit. All rights reserved.
//

#import "UIView+RecursiveSubviews.h"

@implementation UIView (RecursiveSubviews)

- (void)enumerateRecursiveSubviewsUsingBlock:(void (^)(UIView *subview, NSInteger level, BOOL *stop))block;
{
    [self enumerateRecursiveSubviewsUsingBlock:block level:1];
}

- (void)enumerateRecursiveSubviewsUsingBlock:(void (^)(UIView *subview, NSInteger level, BOOL *stop))block level:(NSInteger)level
{
    [self.subviews enumerateObjectsUsingBlock:^(UIView *subview, NSUInteger idx, BOOL *stop) {
        block(subview, level, stop);
        if(!*stop) [subview enumerateRecursiveSubviewsUsingBlock:block level:level + 1];
    }];
}

- (void)recursiveDescription;
{
    void(^block)(UIView *subview, NSInteger level, BOOL *stop) =  ^(UIView *subview, NSInteger level, BOOL *stop){
        NSString *padding = @"|";
        while(level--) padding = [padding stringByAppendingString:@"   |"];
        NSLog(@"%@ %@", padding, subview);
    };
    block(self, 0, nil);
    [self enumerateRecursiveSubviewsUsingBlock:block level:1];
}

@end
