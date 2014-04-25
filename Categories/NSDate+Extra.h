//
//  NSDate+Helper.h
//  yerdle
//
//  Created by Hugues Bernet-Rollande on 1/21/14.
//  Copyright (c) 2014 Yerdle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Extra)

- (BOOL)isToday;
- (BOOL)isThisWeek;
- (NSString *)timeLeftSinceDate:(NSDate *)date;
- (NSString *)timeLeftSinceNow;

@end
