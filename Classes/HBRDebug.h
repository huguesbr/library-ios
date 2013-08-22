//
//  HBRDebug.h
//  yerdle
//
//  Created by Hugues Bernet-Rollande on 8/22/13.
//  Copyright (c) 2013 Yerdle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HBRDebug : NSObject
+ (NSDictionary *)getAppLogCurrentSessionOnly:(BOOL)sessionOnly;
@end
