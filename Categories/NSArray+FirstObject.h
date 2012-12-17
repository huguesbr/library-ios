//
//  NSArray+FirstObject.h
//  Muse
//
//  Created by Hugues Bernet Rollande on 9/4/12.
//  Copyright (c) 2012 Comcast Silicon Valley. All rights reserved.
//


/**
 Add methods to access first object in an Array (similar to lastObject)
 Return nil if not object
 */

#import <Foundation/Foundation.h>

@interface NSArray (FirstObject)
- (id)firstObject;
@end
