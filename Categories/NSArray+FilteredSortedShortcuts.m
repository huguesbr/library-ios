//
//  NSArray+Filter.m
//  yerdle2
//
//  Created by Hugues Bernet-Rollande on 7/30/13.
//  Copyright (c) 2013 Yerdle. All rights reserved.
//

#import "NSArray+FilteredSortedShortcuts.h"

@implementation NSArray (FilteredSortedShortcuts)

- (NSArray *)filteredArrayUsingPredicateFormat:(NSString *)predicateFormat arguments:(NSArray *)arguments sortedWithKey:(NSString *)key ascending:(BOOL)ascending;
{
    return [[self filteredArrayUsingPredicateFormat:predicateFormat arguments:arguments] sortedArrayUsingDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:key ascending:ascending]]];
}

- (NSArray *)filteredArrayUsingPredicateFormat:(NSString *)predicateFormat arguments:(NSArray *)arguments;
{
    return [self filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:predicateFormat argumentArray:arguments]];
}

- (NSArray *)filteredArrayUsingPredicateFormat:(NSString *)predicateFormat;
{
    return [self filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:predicateFormat argumentArray:nil]];
}

- (NSArray *)sortedArrayWithKey:(NSString *)key ascending:(BOOL)ascending;
{
    return [self sortedArrayUsingDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:key ascending:ascending]]];
}

- (NSArray *)collectUsingKey:(NSString *)key;
{
    return [self valueForKey:key];
}

- (NSArray *)collapseUsingKey:(NSString *)key;
{
    return [self valueForKey:key];
}

@end
