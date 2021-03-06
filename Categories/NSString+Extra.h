//
//  NSString+Extra.h
//  HBR
//
//  Created by Hugues Bernet-Rollande on 1/9/13.
//  Copyright (c) 2013 HBR. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extra)

- (BOOL)contains:(NSString *)aString;
- (NSString*)stringByPrependingString:(NSString*)aString;
- (NSString *)stringByStrippingHTML;
- (NSString *)stringByReplacingOccurrencesOfStrings:(NSArray *)targets withStrings:(NSArray *)replacements;

@end
