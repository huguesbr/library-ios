//
//  NSNumber+Extra.m
//  OneDebit
//
//  Created by Hugues on 12/18/12.
//  Copyright (c) 2012 OneDebit. All rights reserved.
//

#import "NSNumber+Extra.h"

@implementation NSNumber (Extra)

+ (NSNumber *)numberWithString:(NSString *)aString numberStyle:(NSNumberFormatterStyle)style;
{
    NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
    [f setNumberStyle:style];
    return [f numberFromString:aString];
}

+ (NSNumber *)numberWithString:(NSString *)aString;
{
    return [self numberWithString:aString numberStyle:NSNumberFormatterDecimalStyle];
}

- (NSString *)stringWithNumberStyle:(NSNumberFormatterStyle)style;
{
    NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
    [f setNumberStyle:style];
    return [f stringFromNumber:self];
}

@end
