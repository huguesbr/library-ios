//
//  NSArray+Uniq.m
//  yerdle2
//
//  Created by Hugues Bernet-Rollande on 7/30/13.
//  Copyright (c) 2013 Yerdle. All rights reserved.
//

#import "NSArray+Uniq.h"

@implementation NSArray (Uniq)
- (NSArray *)arrayByAddingUniqObjectsFromArray:(NSArray *)otherArray;
{
    NSMutableSet *set = [NSMutableSet setWithArray:self];
    [set addObjectsFromArray:otherArray];
    return [set allObjects];
}
@end


@implementation NSMutableArray (Uniq)
- (void)addUniqObjectsFromArray:(NSArray *)otherArray;
{
    [otherArray enumerateObjectsUsingBlock:^(id newObject, NSUInteger idx, BOOL *stop) {
        [self addUniqObject:newObject];
    }];
}

-(void)insertUniqObject:(id)newObject atIndex:(NSUInteger)index;
{
    if (![self containsObject:newObject])
        [self insertObject:newObject atIndex:index];
}

- (void)addUniqObject:(id)newObject;
{
    if (![self containsObject:newObject])
        [self addObject:newObject];
}
@end