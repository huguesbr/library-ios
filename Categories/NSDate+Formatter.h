//
//  NSDate+Formatter.h
//  Yerdle Auction
//
//  Created by Hugues Bernet-Rollande on 6/4/13.
//  Copyright (c) 2013 Yerdle. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifndef kDateFormatterDefaultFormat
#define kDateFormatterDefaultFormat @"mm-dd-yyyy"
#endif

@interface NSDate (Formatter)

- (NSString *)stringWithFormat:(NSString *)format;
- (NSString *)string;

@end
