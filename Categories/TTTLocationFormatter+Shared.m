//
//  TTTLocationFormatter+Shared.m
//  HBR
//
//  Created by Hugues Bernet-Rollande on 1/2/13.
//  Copyright (c) 2013 HBR. All rights reserved.
//

#import "TTTLocationFormatter+Shared.h"

@implementation TTTLocationFormatter (Shared)

+ (TTTLocationFormatter *)sharedFormatter;
{
    static TTTLocationFormatter *_sharedFormatter;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedFormatter = [[TTTLocationFormatter alloc] init];
    });
    return _sharedFormatter;
}

@end
