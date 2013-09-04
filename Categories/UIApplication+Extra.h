//
//  UIApplication+Name.h
//  HBR
//
//  Created by Hugues Bernet-Rollande on 1/29/13.
//  Copyright (c) 2013 HBR. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIApplication (Extra)

@property (readonly) NSString *name;
@property (readonly) NSString *version;
@property (readonly) NSString *revision;
@property (strong, nonatomic) NSDate *startTime;
@property (readonly) NSTimeInterval secondsInApp;
@property (readonly) NSString *sessionId;
- (void)performBlock:( void(^)() )block every:(NSInteger)delay usingKey:(NSString *)settingKey otherwise:( void(^)(NSDate *) )otherBlock;

@end
