//
//  Extra+UIDevice.m
//  yerdle
//
//  Created by Hugues Bernet-Rollande on 9/4/13.
//  Copyright (c) 2013 Yerdle. All rights reserved.
//

#import "UIDevice+Extra.h"

@implementation UIDevice (Extra)
-(NSString *)deviceId
{
    return [[UIDevice currentDevice] identifierForVendor].UUIDString;
}
@end
