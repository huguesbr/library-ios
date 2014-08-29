//
//  NSMutableAttributedString+Extra.m
//  yerdle
//
//  Created by Hugues Bernet-Rollande on 1/8/14.
//  Copyright (c) 2014 Yerdle. All rights reserved.
//

#import "NSMutableAttributedString+Extra.h"

@implementation NSMutableAttributedString (Extra)

- (void)addAttribute:(NSString *)name value:(id)value forString:(NSString *)string
{
    [self addAttribute:name value:value range:[[self string] rangeOfString:string]];
}

- (void)setAttributes:(NSDictionary *)attributes forString:(NSString *)string
{
    [self setAttributes:attributes range:[[self string] rangeOfString:string]];
}

@end
