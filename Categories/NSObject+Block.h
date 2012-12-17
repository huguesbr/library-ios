//
//  NSObject+Block.h
//  My Card
//
//  Created by Hugues Rollande on 12/6/11.
//  Copyright (c) 2011 Comcast Silicon Valley. All rights reserved.
//

/**
 Easily perform a block after a delay
 */

#import <Foundation/Foundation.h>

@interface NSObject (Block)
- (void)performBlock:(void (^)(void))block afterDelay:(NSTimeInterval)delay;
@end
