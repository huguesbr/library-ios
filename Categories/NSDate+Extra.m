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

- (NSString *)timeLeftSinceDate:(NSDate *)date;
{
    NSString *timeLeft;
    NSInteger seconds = [self timeIntervalSinceDate:date];
    NSInteger days = (int) (floor(seconds / (3600 * 24)));
    if(days) seconds -= days * 3600 * 24;
    NSInteger hours = (int) (floor(seconds / 3600));
    if(hours) seconds -= hours * 3600;
    NSInteger minutes = (int) (floor(seconds / 60));
    if(minutes) seconds -= minutes * 60;
    if(days) {
        if(hours) timeLeft = [$$ @"%ldd %ldh", (long)days, (long)hours];
        else timeLeft = [$$ @"%ldd", (long)days];
    }
    else if(hours) {
        if(minutes) timeLeft = [$$ @"%ldh %ldm", (long)hours, (long)minutes];
        else timeLeft = [$$ @"%ldh", (long)hours];
    }
    else if(minutes) {
        if(seconds) timeLeft = [$$ @"%ldm %lds", (long)minutes, (long)seconds];
        else timeLeft = [$$ @"%ldm", (long)minutes];
    }
    else if(seconds)
        timeLeft = [$$ @"%lds", (long)seconds];
    return timeLeft;
}

- (NSString *)timeLeftSinceNow;
{
    return [self timeLeftSinceDate:[NSDate date]];
}

@end
