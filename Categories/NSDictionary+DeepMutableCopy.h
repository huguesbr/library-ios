//
//  NSDictionary+DeepMutableCopy.h
//  HBR
//
//  Created by Hugues Bernet-Rollande on 1/9/13.
//  Copyright (c) 2013 HBR. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (DeepMutableCopy)

- (NSMutableDictionary *) mutableDeepCopy;

@end
