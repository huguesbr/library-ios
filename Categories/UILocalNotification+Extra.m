//
//  UILocalNotification+Extra.m
//  yerdle2
//
//  Created by Hugues Bernet-Rollande on 7/25/13.
//  Copyright (c) 2013 Yerdle. All rights reserved.
//

#import "UILocalNotification+Extra.h"

@implementation UILocalNotification (Extra)
- (NSDictionary *)aps;
{
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithDictionary:self.userInfo];
    if(self.alertBody) dict[@"alert"] = self.alertBody;
    if(self.alertAction) dict[@"a"] = self.alertAction;
    return dict;
}
@end
