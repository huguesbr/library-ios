//
//  NSCache+SharedCache.h
//  Muse
//
//  Created by Hugues on 9/19/12.
//  Copyright (c) 2012 Comcast Silicon Valley. All rights reserved.
//

/**
 Add singleton to access a global cache
 */

#import <Foundation/Foundation.h>

@interface NSCache (SharedCache)
+ (NSCache *)sharedCache;
@end
