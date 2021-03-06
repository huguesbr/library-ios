//
//  UIImage+Color.h
//  HBR
//
//  Created by Hugues Bernet-Rollande on 1/22/13.
//  Copyright (c) 2013 HBR. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Color)

+ (UIImage *)imageWithColor:(UIColor *)color;
+ (UIImage *)imageWithSize:(CGSize)size color:(UIColor *)color;
- (UIColor *)averageColor;
- (UIColor *)mergedColor;
;

@end