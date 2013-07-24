//
//  NSObject+isNull.m
//  yerdle2
//
//  Created by Hugues Bernet-Rollande on 7/17/13.
//  Copyright (c) 2013 Yerdle. All rights reserved.
//

#import "NSObject+isNull.h"

@implementation NSObject (isNull)
- (BOOL)isNull;
{
    return [self isEqual:[NSNull null]];
}
- (BOOL)isNotNull;
{
    return ![self isEqual:[NSNull null]];
}
@end
