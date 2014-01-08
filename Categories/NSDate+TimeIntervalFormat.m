//
//  NSDate+TimeIntervalFormat.m
//  yerdle
//
//  Created by Hugues Bernet-Rollande on 1/7/14.
//  Copyright (c) 2014 Yerdle. All rights reserved.
//

#import "NSDate+TimeIntervalFormat.h"

#import <FormatterKit/TTTTimeIntervalFormatter.h>

@implementation NSDate (TimeIntervalFormat)

- (NSString *)stringTimeIntervalSinceDate:(NSDate *)date;
{
    TTTTimeIntervalFormatter *formatter = [[TTTTimeIntervalFormatter alloc] init];
    return [formatter stringForTimeIntervalFromDate:date toDate:self];
}

- (NSString *)stringTimeIntervalSinceNow;
{
    return [self stringTimeIntervalSinceDate:[NSDate date]];
}

@end
