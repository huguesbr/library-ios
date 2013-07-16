//
//  NSArray+Intersect.m
//  yerdle2
//
//  Created by Hugues Bernet-Rollande on 7/9/13.
//  Copyright (c) 2013 Yerdle. All rights reserved.
//

#import "NSArray+Intersect.h"

@implementation NSArray (Intersect)

- (NSArray *)intersectArray:(NSArray *)array
{
    NSMutableSet *set = [NSMutableSet setWithArray: self];
    [set intersectSet: [NSSet setWithArray: array]];
    return [set allObjects];
}

@end
