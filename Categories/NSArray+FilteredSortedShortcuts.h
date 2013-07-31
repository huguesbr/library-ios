//
//  NSArray+Filter.h
//  yerdle2
//
//  Created by Hugues Bernet-Rollande on 7/30/13.
//  Copyright (c) 2013 Yerdle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (FilteredSortedShortcuts)

- (NSArray *)filteredArrayUsingPredicateFormat:(NSString *)predicateFormat sortedWithKey:(NSString *)key ascending:(BOOL)ascending;
- (NSArray *)filteredArrayUsingPredicateFormat:(NSString *)predicateFormat;
- (NSArray *)sortedArrayWithKey:(NSString *)key ascending:(BOOL)ascending;

@end
