//
//  DBTYelpHelper.m
//  Prototype
//
//  Created by Hugues on 11/8/12.
//  Copyright (c) 2012 1debit. All rights reserved.
//

#import "HBRYelpHelper.h"

@implementation HBRYelpHelper

+ (BOOL)isYelpInstalled;
{
    return [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"yelp:"]];
}

+ (void)openYelpWithPath:(NSString *)path;
{
    NSString *yelpURLString;
	if ([self isYelpInstalled]) {
        yelpURLString = [@"yelp://" stringByAppendingFormat:@"%@", path];
    } else {
        yelpURLString = [@"http://yelp.com" stringByAppendingFormat:@"%@", path];
    }
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:yelpURLString]];
}

@end
