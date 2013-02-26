//
//  UIView+Extra.h
//  Muse
//
//  Created by Hugues on 8/7/12.
//  Copyright (c) 2012 Comcast Silicon Valley. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extra)

- (void)makeRoundedCornerWithRadius:(CGFloat)radius border:(CGFloat)border;

- (void)makeRoundedCornerWithRadius:(CGFloat)radius border:(CGFloat)border color:(UIColor *)color;

- (void)makeRoundedCornerWithRadius:(CGFloat)radius border:(CGFloat)border color:(UIColor *)color clipBound:(BOOL)clip;

- (void)setRasterizationScale:(CGFloat)rasterizationScale;

- (BOOL)isAnimating;

@end
