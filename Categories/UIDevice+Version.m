//
//  UIDevice+Version.m
//  yerdle2
//
//  Created by Hugues Bernet-Rollande on 6/17/13.
//  Copyright (c) 2013 Yerdle. All rights reserved.
//

#import "UIDevice+Version.h"

@implementation UIDevice (Version)

-(BOOL)isRunningAtLeastIos7;
{
    return [[[UIDevice currentDevice] systemVersion] compare:@"7.0" options:NSNumericSearch] != NSOrderedAscending;
}

-(BOOL)isRunningAtLeastIos6;
{
    return [[[UIDevice currentDevice] systemVersion] compare:@"6.0" options:NSNumericSearch] != NSOrderedAscending;
}

@end
