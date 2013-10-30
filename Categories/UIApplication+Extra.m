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
#define kAppAlreadyLaunchedKey "AppAlreadyLaunchedSettingKey"
#define kAppAlreadyLaunchedSettingKey @"AppAlreadyLaunchedSettingKey"

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
    __block BOOL _firstAppLaunch = [[self associatedObjectforKey:kAppAlreadyLaunchedKey] boolValue];
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _firstAppLaunch = ![[NSUserDefaults standardUserDefaults] boolForKey:kAppAlreadyLaunchedSettingKey];
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:kAppAlreadyLaunchedSettingKey];
        [[NSUserDefaults standardUserDefaults] synchronize];
        [self setAssociatedObject:@(_firstAppLaunch) forKey:kAppAlreadyLaunchedKey];
    });
    return _firstAppLaunch;
}

- (NSDate *)installDate;
{
    static NSDate *_installDate;
    if(!_installDate) {
        NSURL* pathToDocumentsFolder = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
        _installDate = [[[NSFileManager defaultManager] attributesOfItemAtPath:pathToDocumentsFolder.path error:nil] objectForKey:NSFileCreationDate];
    }
    return _installDate;
}

- (NSTimeInterval)secondsSinceInstall;
{
    return floor([[NSDate date] timeIntervalSinceDate:self.installDate]);
}

- (NSDate *)lastUpdateDate;
{
    static NSDate *_lastUpdateDate;
    if(!_lastUpdateDate) {
        NSString* pathToInfoPlist = [[NSBundle mainBundle] pathForResource:@"Info" ofType:@"plist"];
        NSString* pathToAppBundle = [pathToInfoPlist stringByDeletingLastPathComponent];
        _lastUpdateDate  = [[[NSFileManager defaultManager] attributesOfItemAtPath:pathToAppBundle error:nil] objectForKey:NSFileModificationDate];
    }
    return _lastUpdateDate;
}

- (NSTimeInterval)secondsSinceLastUpdate;
{
    return floor([[NSDate date] timeIntervalSinceDate:self.lastUpdateDate]);
}



-(void)setSessionStartTime:(NSDate *)startTime
{
    [self setAssociatedObject:startTime forKey:kUIApplicationStartTimeKey];
}

-(NSDate *)sessionStartTime
{
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

- (NSString *)release_type;
{
    NSString *release = @"unknown";
#if DEBUG
    release = @"debug";
#endif
#if RELEASE
    release = @"apple-store";
#endif
#if STAGING
    release = @"staging";
#endif
#if BETA
    release = @"beta";
#endif
#if (TARGET_IPHONE_SIMULATOR)
    release = @"simulator";
#endif
    return release;
}

- (BOOL)isBeta;
{
    return [self.release_type isEqualToString:@"beta"];
}

- (void)performBlock:( void(^)() )block every:(NSInteger)delay usingKey:(NSString *)settingKey otherwise:( void(^)(NSDate *) )otherBlock;
{
    NSDate *lastDate = [Settings objectForKey:settingKey];
    NSLog(@"Last executed %@ :%@", settingKey, lastDate);
    if([lastDate timeIntervalSinceNow] < -delay || !lastDate) {
        [Settings setObject:[NSDate date] forKey:settingKey];
        [Settings synchronize];
        if(block) block();
    } else {
        if(otherBlock) otherBlock(lastDate);
    }
}

- (void)performBlockOnce:( void(^)() )block usingKey:(NSString *)settingKey;
{
    if([Settings boolForKey:settingKey] == NO) {
        [Settings setBool:YES forKey:settingKey];
        [Settings synchronize];
        if(block) block();
    }
}

@end
