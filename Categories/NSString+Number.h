//
//  NSString+Number.h
//  HBR
//
//  Created by Hugues on 12/18/12.
//  Copyright (c) 2012 HBR. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Number)

- (NSNumber *)numberValueWithNumberStyle:(NSNumberFormatterStyle)style;

- (NSNumber *)numberValue;

- (NSString *)stringWithDigitOnly;

@end
