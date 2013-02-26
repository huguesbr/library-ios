//
//  NSDictionary+DeepMutableCopy.h
//  OneDebit
//
//  Created by Hugues Bernet-Rollande on 1/9/13.
//  Copyright (c) 2013 OneDebit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (DeepMutableCopy)

- (NSMutableDictionary *) mutableDeepCopy;

@end
