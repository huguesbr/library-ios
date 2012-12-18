//
//  NSString+Number.m
//  OneDebit
//
//  Created by Hugues on 12/18/12.
//  Copyright (c) 2012 OneDebit. All rights reserved.
//

#import "NSString+Number.h"

@implementation NSString (Number)

- (NSNumber *)numberValueWithNumberStyle:(NSNumberFormatterStyle)style;
{
    NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
    [f setNumberStyle:style];
    return [f numberFromString:self];
}

- (NSNumber *)numberValue;
{
    return [self numberValueWithNumberStyle:NSNumberFormatterDecimalStyle];
}

- (NSString *)stringWithDigitOnly;
{
    return [[self componentsSeparatedByCharactersInSet:[[NSCharacterSet decimalDigitCharacterSet] invertedSet]] componentsJoinedByString:@""];
}

@end
