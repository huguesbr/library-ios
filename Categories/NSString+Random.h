//
//  NSString+Random.h
//  OneDebit
//
//  Created by Hugues Bernet-Rollande on 2/1/13.
//  Copyright (c) 2013 OneDebit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Random)

+ (NSString *)stringWithRandomCharacters:(NSString *)characters ofLength:(int)len;
+ (NSString *)stringWithRandomAlphanumericalCharactersOfLength:(int)len;
+ (NSString *)stringWithRandomAlphaCharactersOfLength:(int)len;
+ (NSString *)stringWithRandomNumericalCharactersOfLength:(int)len;

@end
