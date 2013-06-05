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
    return [UIFont fontWithName:kUIFontSystemFontDefaultBold size:fontSize];
}

+ (UIFont *)systemFontOfSize:(CGFloat)fontSize
{
    return [UIFont fontWithName:kUIFontSystemFontDefault size:fontSize];
}

#pragma clang diagnostic pop

@end
