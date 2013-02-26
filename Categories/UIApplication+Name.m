//
//  UIApplication+Name.m
//  OneDebit
//
//  Created by Hugues Bernet-Rollande on 1/29/13.
//  Copyright (c) 2013 OneDebit. All rights reserved.
//

#import "UIApplication+Name.h"

@implementation UIApplication (Name)
- (NSString *)name;
{
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"];
}
@end
