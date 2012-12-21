//
//  UIView+Extra.m
//  Muse
//
//  Created by Hugues on 8/7/12.
//  Copyright (c) 2012 Comcast Silicon Valley. All rights reserved.
//

#import "UIView+Extra.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIView (Extra)

- (void)makeRoundedCornerWithRadius:(CGFloat)radius border:(CGFloat)border;
{
    [self makeRoundedCornerWithRadius:radius border:border color:[UIColor blackColor]];
}

- (void)makeRoundedCornerWithRadius:(CGFloat)radius border:(CGFloat)border color:(UIColor *)color;
{
    [self makeRoundedCornerWithRadius:radius border:border color:color clipBound:YES];
}

- (void)makeRoundedCornerWithRadius:(CGFloat)radius border:(CGFloat)border color:(UIColor *)color clipBound:(BOOL)clip;
{
    self.layer.borderColor = color.CGColor;
    self.layer.cornerRadius = radius;
    self.layer.borderWidth = border;
    self.layer.masksToBounds = clip;
}

- (void)setRasterizationScale:(CGFloat)rasterizationScale;
{
    CALayer *layer = [self layer];
    [layer setRasterizationScale:rasterizationScale];
    if(rasterizationScale == 1.){
        [layer setShouldRasterize:NO];
    } else {
        [layer setShouldRasterize:YES];
    }

}

@end