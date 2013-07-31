//
//  NSArray+Filter.m
//  yerdle2
//
//  Created by Hugues Bernet-Rollande on 7/30/13.
//  Copyright (c) 2013 Yerdle. All rights reserved.
//

#import "NSArray+FilteredSortedShortcuts.h"

@implementation NSArray (FilteredSortedShortcuts)

- (NSArray *)filteredArrayUsingPredicateFormat:(NSString *)predicateFormat sortedWithKey:(NSString *)key ascending:(BOOL)ascending;
{
    return [[self filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:predicateFormat]] sortedArrayUsingDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:key ascending:ascending]]];
}

- (NSArray *)filteredArrayUsingPredicateFormat:(NSString *)predicateFormat;
{
    return [self filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:predicateFormat]];
}

- (NSArray *)sortedArrayWithKey:(NSString *)key ascending:(BOOL)ascending;
{
    return [self sortedArrayUsingDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:key ascending:ascending]]];
}

@end
