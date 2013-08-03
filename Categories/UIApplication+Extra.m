//
//  UIApplication+Name.m
//  OneDebit
//
//  Created by Hugues Bernet-Rollande on 1/29/13.
//  Copyright (c) 2013 OneDebit. All rights reserved.
//

#import "UIApplication+Extra.h"

@implementation UIApplication (Extra)

- (NSString *)name;
{
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"];
}

- (NSString *)version;
{
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
}

- (NSString *)revision;
{
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"];
}

- (void)performBlock:( void(^)() )block every:(NSInteger)delay usingKey:(NSString *)settingKey otherwise:( void(^)(NSDate *) )otherBlock;
{
    NSDate *lastDate = [Settings objectForKey:settingKey];
    NSLog(@"%@ :%@", settingKey, lastDate);
    if([lastDate timeIntervalSinceNow] < -delay || !lastDate) {
        [Settings setObject:[NSDate date] forKey:settingKey];
        [Settings synchronize];
        if(block) block();
    } else {
        if(otherBlock) otherBlock(lastDate);
    }
}

@end
