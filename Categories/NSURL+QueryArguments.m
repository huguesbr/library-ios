//
//  NSURL+QueryArguments.m
//  HBR
//
//  Created by Hugues Bernet-Rollande on 2/19/13.
//  Copyright (c) 2013 HBR. All rights reserved.
//

#import "NSURL+QueryArguments.h"

@implementation NSURL (QueryArguments)
- (NSDictionary *)queryDict;
{
    NSMutableDictionary *arguments = [@{} mutableCopy];
    [[self.query componentsSeparatedByString:@"&"] enumerateObjectsUsingBlock:^(NSString *param, NSUInteger idx, BOOL *stop) {
        // skip empty params
        if([param isEqualToString:@""]) return;
        NSArray *keyValue = [param componentsSeparatedByString:@"="];
        NSString *key = [keyValue[0] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        // if no value set empty string (we just care of presence)
        NSString *value = @"";
        if(keyValue.count > 1){
            value = [keyValue[1] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        }
        arguments[key] = value;
    }];
    return [NSDictionary dictionaryWithDictionary:arguments];
}
@end
