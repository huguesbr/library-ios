//
//  DBTYelpHelper.h
//  Prototype
//
//  Created by Hugues on 11/8/12.
//  Copyright (c) 2012 1debit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HBRYelpHelper : NSObject

+ (BOOL)isYelpInstalled;
+ (void)openYelpWithPath:(NSString *)path;

@end
