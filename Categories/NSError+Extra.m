//
//  NSError+Extra.m
//  HBR
//
//  Created by Hugues Bernet-Rollande on 1/15/13.
//  Copyright (c) 2013 HBR. All rights reserved.
//

#import "NSError+Extra.h"

@implementation NSError (Extra)

+ (NSError *)errorWithDomain:(NSString *)domain code:(NSInteger)code localizedDescription:(NSString *)description;
{
    NSDictionary *userInfo;
    if(description) userInfo = @{NSLocalizedDescriptionKey: description};
    return [NSError errorWithDomain:domain code:code userInfo:userInfo];
}

@end
