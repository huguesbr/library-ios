//
//  UIFont+SytemFont.m
//  Muse
//
//  Created by Hugues Bernet Rollande on 9/20/12.
//  Copyright (c) 2012 Comcast Silicon Valley. All rights reserved.
//

#import "UIFont+SytemFont.h"

@implementation UIFont (SytemFont)

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"

+ (UIFont *)boldSystemFontOfSize:(CGFloat)fontSize;
{
    UIFont *systemFont =  [UIFont fontWithName:kUIFontSystemFontDefaultBold size:fontSize];
//    NSLog(@"systemFont: %@", systemFont);
    return systemFont;
}

+ (UIFont *)systemFontOfSize:(CGFloat)fontSize
{
    UIFont *systemFont =  [UIFont fontWithName:kUIFontSystemFontDefault size:fontSize];
//    NSLog(@"systemFont: %@", systemFont);
    return systemFont;
}

#pragma clang diagnostic pop

@end
