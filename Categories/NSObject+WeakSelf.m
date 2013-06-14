//
//  NSObject+WeakSelf.m
//  HBR
//
//  Created by Hugues Bernet-Rollande on 1/21/13.
//  Copyright (c) 2013 HBR. All rights reserved.
//

#import "NSObject+WeakSelf.h"

@implementation NSObject (WeakSelf)

-(id)weakSelf
{
    __weak id weakSelf = self;
    return weakSelf;
}

@end
