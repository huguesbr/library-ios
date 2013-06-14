//
//  NSMutableDictionary+Shared.m
//  HBR
//
//  Created by Hugues Bernet-Rollande on 1/15/13.
//  Copyright (c) 2013 HBR. All rights reserved.
//

#import "NSMutableDictionary+Shared.h"

@implementation NSMutableDictionary (Shared)

+ (NSMutableDictionary *)sharedDictionary;
{
    static NSMutableDictionary *_sharedDictionary;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedDictionary = [[NSMutableDictionary alloc] init];
    });
    return _sharedDictionary;
}

@end
