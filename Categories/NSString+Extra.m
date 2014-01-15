//
//  NSString+Extra.m
//  HBR
//
//  Created by Hugues Bernet-Rollande on 1/9/13.
//  Copyright (c) 2013 HBR. All rights reserved.
//

#import "NSString+Extra.h"
//#import "libc.h"

@implementation NSString (Extra)

- (BOOL)contains:(NSString *)aString;
{
    return [self rangeOfString:aString].location != NSNotFound;
}


- (NSString*)stringByPrependingString:(NSString*)aString;
{
    return [aString stringByAppendingString:self];
}

- (NSString *)stringByStrippingHTML;
{
    NSRange r;
    NSString *s = [NSString stringWithString:self];
    while ((r = [s rangeOfString:@"<[^>]+>" options:NSRegularExpressionSearch]).location != NSNotFound)
        s = [s stringByReplacingCharactersInRange:r withString:@""];
    return s;
}

@end
