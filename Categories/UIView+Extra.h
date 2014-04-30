//
//  UIView+Extra.h
//  Muse
//
//  Created by Hugues on 8/7/12.
//  Copyright (c) 2012 Comcast Silicon Valley. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extra)

- (void)setShadowWithColor:(UIColor *)color offset:(CGSize)offset opacity:(CGFloat)opacity radius:(CGFloat)radius;

- (void)setBorderWithColor:(UIColor *)color width:(CGFloat)width radius:(CGFloat)radius clipping:(BOOL)clipping;

- (void)makeRoundedWithBorder:(CGFloat)border;

- (void)makeRoundedCornerWithRadius:(CGFloat)radius border:(CGFloat)border;

- (void)makeRoundedCornerWithRadius:(CGFloat)radius border:(CGFloat)border color:(UIColor *)color;

- (void)makeRoundedCornerWithRadius:(CGFloat)radius border:(CGFloat)border color:(UIColor *)color clipBound:(BOOL)clip;

- (void)makeRoundedCornerWithRadius:(CGFloat)radius border:(CGFloat)border color:(UIColor *)color clipBound:(BOOL)clip shouldRasterize:(BOOL)shouldRasterize;

- (void)setRasterizationScale:(CGFloat)rasterizationScale;

- (BOOL)isAnimating;

@end
