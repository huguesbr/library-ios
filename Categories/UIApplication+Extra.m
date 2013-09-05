//
//  UIApplication+Name.m
//  OneDebit
//
//  Created by Hugues Bernet-Rollande on 1/29/13.
//  Copyright (c) 2013 OneDebit. All rights reserved.
//

#import "UIApplication+Extra.h"
#import "NSObject+AssociatedObject.h"

#define kUIApplicationStartTimeKey "kUIApplicationStartTimeKey"
#define kUIApplicationLaunchOptionsKey "kUIApplicationLaunchOptionsKey"
#define kAppAlreadyLaunchedKey @"AppAlreadyLaunchedKey"

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

- (BOOL)firstAppLaunch;
{
    __block BOOL _firstAppLaunch;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _firstAppLaunch = ![[NSUserDefaults standardUserDefaults] boolForKey:kAppAlreadyLaunchedKey];
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:kAppAlreadyLaunchedKey];
    });
    return _firstAppLaunch;
}

-(void)setSessionStartTime:(NSDate *)startTime
{
    [self setAssociatedObject:startTime forKey:kUIApplicationStartTimeKey];
}

-(NSDate *)sessionStartTime
{
    NSLog(@"%@", [self associatedObjectforKey:kUIApplicationStartTimeKey]);
    return [self associatedObjectforKey:kUIApplicationStartTimeKey];
}

-(void)setLaunchOptions:(NSDictionary *)launchOptions
{
    [self setAssociatedObject:launchOptions forKey:kUIApplicationLaunchOptionsKey];
}

-(NSDictionary *)launchOptions
{
    return [self associatedObjectforKey:kUIApplicationLaunchOptionsKey];
}

-(NSTimeInterval)sessionDuration
{
    return [[NSDate date] timeIntervalSinceDate:self.sessionStartTime];
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
