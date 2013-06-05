//
//  NSDate+Formatter.m
//  Yerdle Auction
//
//  Created by Hugues Bernet-Rollande on 6/4/13.
//  Copyright (c) 2013 Yerdle. All rights reserved.
//

#import "NSDate+Formatter.h"

@implementation NSDate (Formatter)

- (NSString *)stringWithFormat:(NSString *)format;
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    return [dateFormatter stringFromDate:self];
}

- (NSString *)string;
{
    return [self stringWithFormat:kDateFormatterDefaultFormat];
}

@end
