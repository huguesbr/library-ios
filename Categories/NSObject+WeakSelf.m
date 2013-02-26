//
//  NSObject+WeakSelf.m
//  OneDebit
//
//  Created by Hugues Bernet-Rollande on 1/21/13.
//  Copyright (c) 2013 OneDebit. All rights reserved.
//

#import "NSObject+WeakSelf.h"

@implementation NSObject (WeakSelf)

-(id)weakSelf
{
    __weak id weakSelf = self;
    return weakSelf;
}

@end
