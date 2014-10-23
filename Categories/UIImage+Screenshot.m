//
//  UIImage+Screenshot.m
//  yerdle
//
//  Created by Hugues Bernet-Rollande on 10/23/14.
//  Copyright (c) 2014 Yerdle. All rights reserved.
//

#import "UIImage+Screenshot.h"

@implementation UIImage (Screenshot)
+ (instancetype)screenshot
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    CGSize windowSize = [window bounds].size;
    
    UIGraphicsBeginImageContext(windowSize);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [window.layer renderInContext:context];
    
    UIImage *screenshot = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return screenshot;
}
@end
