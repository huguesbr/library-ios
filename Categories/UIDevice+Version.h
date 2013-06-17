//
//  UIDevice+Version.h
//  yerdle2
//
//  Created by Hugues Bernet-Rollande on 6/17/13.
//  Copyright (c) 2013 Yerdle. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (Version)

@property (readonly, assign) BOOL isRunningAtLeastIos7;
@property (readonly, assign) BOOL isRunningAtLeastIos6;

@end
