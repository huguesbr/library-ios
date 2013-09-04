//
//  UIApplication+Name.m
//  OneDebit
//
//  Created by Hugues Bernet-Rollande on 1/29/13.
//  Copyright (c) 2013 OneDebit. All rights reserved.
//

#import "UIApplication+Extra.h"
#import "NSObject+AssociatedObject.h"

#define kUIApplicationStartTimeKey ""

@implementation UIApplication (Extra)


- (NSString *)sessionId
{
    static NSString *_sessionId;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sessionId = [[NSUUID UUID] UUIDString];
    });
    return _sessionId;
}

-(void)setStartTime:(NSDate *)startTime
{
    [self setAssociatedObject:startTime forKey:kUIApplicationStartTimeKey];
}

-(NSDate *)startTime
{
    return [self associatedObjectforKey:kUIApplicationStartTimeKey];
}

-(NSTimeInterval)secondsInApp
{
    return [[NSDate date] timeIntervalSinceDate:self.startTime];
}


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
