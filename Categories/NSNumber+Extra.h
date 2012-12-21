//
//  NSNumber+Extra.h
//  OneDebit
//
//  Created by Hugues on 12/18/12.
//  Copyright (c) 2012 OneDebit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumber (Extra)

+ (NSNumber *)numberWithString:(NSString *)aString numberStyle:(NSNumberFormatterStyle)style;
+ (NSNumber *)numberWithString:(NSString *)aString;
- (NSString *)stringWithNumberStyle:(NSNumberFormatterStyle)style;

@end
