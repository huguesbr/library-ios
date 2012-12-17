//
//  NSCache+SharedCache.m
//  Muse
//
//  Created by Hugues on 9/19/12.
//  Copyright (c) 2012 Comcast Silicon Valley. All rights reserved.
//

#import "NSCache+SharedCache.h"

@implementation NSCache (SharedCache)
+ (NSCache *)sharedCache
{
    static NSCache *_sharedCache;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedCache = [[NSCache alloc] init];
    });
    return _sharedCache;
}
@end
