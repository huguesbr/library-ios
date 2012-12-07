//
//  NSString+URL.m
//  Prototype
//
//  Created by Hugues on 11/13/12.
//  Copyright (c) 2012 1debit. All rights reserved.
//

#import "NSString+URL.h"

@implementation NSString (URL)

- (NSURL *)urlValue;
{
    return [NSURL URLWithString:self];
}

@end
