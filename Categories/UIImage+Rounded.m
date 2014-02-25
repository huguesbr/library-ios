//
//  UIImage+Rounded.m
//  yerdle
//
//  Created by Hugues Bernet-Rollande on 2/24/14.
//  Copyright (c) 2014 Yerdle. All rights reserved.
//

#import "UIImage+Rounded.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIImage (Rounded)
-(UIImage *)makeRoundedImageWithRadius:(float)radius;
{
    CALayer *imageLayer = [CALayer layer];
    imageLayer.frame = CGRectMake(0, 0, self.size.width, self.size.height);
    imageLayer.contents = (id) self.CGImage;
    
    imageLayer.masksToBounds = YES;
    imageLayer.cornerRadius = radius;
    
    UIGraphicsBeginImageContext(self.size);
    [imageLayer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *roundedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return roundedImage;
}
@end
