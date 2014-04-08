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
- (id)firstObjects:(NSInteger)nb;
{
    return [self firstObjects:nb];
}
- (id)subarrayWithCount:(NSInteger)nb;
{
    return [self subarrayWithRange:NSMakeRange(0, MIN(self.count, nb))];
}
@end
