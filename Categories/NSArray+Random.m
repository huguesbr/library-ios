//
//  NSArray+Random.m
//  yerdle2
//
//  Created by Hugues Bernet-Rollande on 6/18/13.
//  Copyright (c) 2013 Yerdle. All rights reserved.
//

#import "NSArray+Random.h"

@implementation NSArray (Random)
- (id)randomObject;
{
    if (!self.count) return nil;
    return self[arc4random() % self.count];
}
@end
