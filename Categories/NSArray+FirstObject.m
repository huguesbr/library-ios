//
//  NSArray+FirstObject.m
//  Muse
//
//  Created by Hugues Bernet Rollande on 9/4/12.
//  Copyright (c) 2012 Comcast Silicon Valley. All rights reserved.
//

#import "NSArray+FirstObject.h"

@implementation NSArray (FirstObject)
- (id)firstObject;
{
    id firstObject;
    if ([self count] > 0) firstObject = [self objectAtIndex:0];
    return firstObject;
}
@end
