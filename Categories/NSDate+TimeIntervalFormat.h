//
//  NSDate+TimeIntervalFormat.h
//  yerdle
//
//  Created by Hugues Bernet-Rollande on 1/7/14.
//  Copyright (c) 2014 Yerdle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (TimeIntervalFormat)

- (NSString *)stringTimeIntervalSinceDate:(NSDate *)date;
- (NSString *)stringTimeIntervalSinceNow;

@end
