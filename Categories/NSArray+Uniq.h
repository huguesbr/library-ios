//
//  NSArray+Uniq.h
//  yerdle2
//
//  Created by Hugues Bernet-Rollande on 7/30/13.
//  Copyright (c) 2013 Yerdle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Uniq)
- (NSArray *)arrayByAddingUniqObjectsFromArray:(NSArray *)otherArray;
@end


@interface NSMutableArray (Uniq)
- (void)addUniqObjectsFromArray:(NSArray *)otherArray;
-(void)insertUniqObject:(id)newObject atIndex:(NSUInteger)index;
- (void)addUniqObject:(id)newObject;
@end