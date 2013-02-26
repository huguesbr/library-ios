//
//  NSString+Extra.m
//  OneDebit
//
//  Created by Hugues Bernet-Rollande on 1/9/13.
//  Copyright (c) 2013 OneDebit. All rights reserved.
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

@end
