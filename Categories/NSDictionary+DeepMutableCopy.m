//
//  NSDictionary+DeepMutableCopy.m
//  OneDebit
//
//  Created by Hugues Bernet-Rollande on 1/9/13.
//  Copyright (c) 2013 OneDebit. All rights reserved.
//

#import "NSDictionary+DeepMutableCopy.h"

@implementation NSDictionary (DeepMutableCopy)

- (NSMutableDictionary *) mutableDeepCopy;
{
    NSMutableDictionary * returnDict = [[NSMutableDictionary alloc] initWithCapacity:self.count];
    NSArray * keys = [self allKeys];
    
    for(id key in keys) {
        id oneValue = [self objectForKey:key];
        id oneCopy = nil;
        
        if([oneValue respondsToSelector:@selector(mutableDeepCopy)]) {
            oneCopy = [oneValue mutableDeepCopy];
        }
        else if([oneValue respondsToSelector:@selector(mutableCopy)]) {
            oneCopy = [oneValue mutableCopy];
        }
        else {
            oneCopy = [oneValue copy];
        }
        [returnDict setValue:oneValue forKey:key];
    }
    return returnDict;
}

@end
