//
//  NSObject+Block.m
//  My Card
//
//  Created by Hugues Rollande on 12/6/11.
//  Copyright (c) 2011 Comcast Silicon Valley. All rights reserved.
//

#import "NSObject+Block.h"

@implementation NSObject (Block)
- (void)performBlock:(void (^)(void))block afterDelay:(NSTimeInterval)delay
{
    int64_t delta = (int64_t)(1.0e9 * delay);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, delta), dispatch_get_current_queue(), block);
}
@end
