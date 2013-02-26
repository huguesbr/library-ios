//
//  NSString+Random.m
//  OneDebit
//
//  Created by Hugues Bernet-Rollande on 2/1/13.
//  Copyright (c) 2013 OneDebit. All rights reserved.
//

#import "NSString+Random.h"

@implementation NSString (Random)

+ (NSString *)stringWithRandomCharacters:(NSString *)characters ofLength:(int)len;
{
    NSMutableString *randomString = [NSMutableString stringWithCapacity: len];
    for (int i=0; i<len; i++) {
        [randomString appendFormat: @"%C", [characters characterAtIndex: arc4random() % [characters length]]];
    }
    return randomString;
}

+ (NSString *)stringWithRandomAlphanumericalCharactersOfLength:(int)len;
{
    return [self stringWithRandomCharacters:@"abcdefghijklmnopqrstuvwxyz0123456789" ofLength:len];
}

+ (NSString *)stringWithRandomNumericalCharactersOfLength:(int)len;
{
    return [self stringWithRandomCharacters:@"0123456789" ofLength:len];
}

+ (NSString *)stringWithRandomAlphaCharactersOfLength:(int)len;
{
    return [self stringWithRandomCharacters:@"abcdefghijklmnopqrstuvwxyz" ofLength:len];
}

@end
