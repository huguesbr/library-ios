//
//  NSDate+Helper.m
//  yerdle
//
//  Created by Hugues Bernet-Rollande on 1/21/14.
//  Copyright (c) 2014 Yerdle. All rights reserved.
//

#import "NSDate+Extra.h"

@implementation NSDate (Extra)

- (BOOL)isToday;
{
    NSDateComponents *otherDay = [[NSCalendar currentCalendar] components:NSEraCalendarUnit|NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:self];
    NSDateComponents *today = [[NSCalendar currentCalendar] components:NSEraCalendarUnit|NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:[NSDate date]];
    return [today day] == [otherDay day] && [today month] == [otherDay month] &&  [today year] == [otherDay year] && [today era] == [otherDay era];
}

- (BOOL)isThisWeek;
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger todaysWeek = [[calendar components:NSWeekCalendarUnit fromDate:[NSDate date]] week];
    NSUInteger dateWeek = [[calendar components:NSWeekCalendarUnit fromDate:self] week];
    return todaysWeek == dateWeek;
}

@end
