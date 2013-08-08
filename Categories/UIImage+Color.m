//
//  UIImage+Color.m
//  HBR
//
//  Created by Hugues Bernet-Rollande on 1/22/13.
//  Copyright (c) 2013 HBR. All rights reserved.
//

#import "UIImage+Color.h"

@implementation UIImage (Color)

+ (UIImage *)imageWithColor:(UIColor *)color {
    return [self imageWithSize:CGSizeMake(1, 1) color:color];
}

+ (UIImage *)imageWithSize:(CGSize)size color:(UIColor *)color;
{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    // Create a 1 by 1 pixel context
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    [color setFill];
    UIRectFill(rect);   // Fill it with your color
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

//- (UIColor *)averageColor;
//{
//    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
//    unsigned char rgba[4];
//    CGContextRef context = CGBitmapContextCreate(rgba, 1, 1, 8, 4, colorSpace, kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Big);
//    
//    CGContextDrawImage(context, CGRectMake(0, 0, 1, 1), self.CGImage);
//    CGColorSpaceRelease(colorSpace);
//    CGContextRelease(context);
//    
//    if(rgba[3] > 0) {
//        CGFloat alpha = ((CGFloat)rgba[3])/255.0;
//        CGFloat multiplier = alpha/255.0;
//        return [UIColor colorWithRed:((CGFloat)rgba[0])*multiplier
//                               green:((CGFloat)rgba[1])*multiplier
//                                blue:((CGFloat)rgba[2])*multiplier
//                               alpha:alpha];
//    }
//    else {
//        return [UIColor colorWithRed:((CGFloat)rgba[0])/255.0
//                               green:((CGFloat)rgba[1])/255.0
//                                blue:((CGFloat)rgba[2])/255.0
//                               alpha:((CGFloat)rgba[3])/255.0];
//    }
//}


- (UIColor *)averageColor
{
    CGImageRef rawImageRef = [self CGImage];
    
    // This function returns the raw pixel values
	CFDataRef data = CGDataProviderCopyData(CGImageGetDataProvider(rawImageRef));
    const UInt8 *rawPixelData = CFDataGetBytePtr(data);
    
    NSUInteger imageHeight = CGImageGetHeight(rawImageRef);
    NSUInteger imageWidth  = CGImageGetWidth(rawImageRef);
    NSUInteger bytesPerRow = CGImageGetBytesPerRow(rawImageRef);
	NSUInteger stride = CGImageGetBitsPerPixel(rawImageRef) / 8;
    
    // Here I sort the R,G,B, values and get the average over the whole image
    unsigned int red   = 0;
    unsigned int green = 0;
    unsigned int blue  = 0;
    
	for (int row = 0; row < imageHeight; row++) {
		const UInt8 *rowPtr = rawPixelData + bytesPerRow * row;
		for (int column = 0; column < imageWidth; column++) {
            red    += rowPtr[0];
            green  += rowPtr[1];
            blue   += rowPtr[2];
			rowPtr += stride;
            
        }
    }
	CFRelease(data);
    
	CGFloat f = 1.0f / (255.0f * imageWidth * imageHeight);
	return [UIColor colorWithRed:f * red  green:f * green blue:f * blue alpha:1];
}

- (UIColor *)mergedColor
{
	CGSize size = {1, 1};
	UIGraphicsBeginImageContext(size);
	CGContextRef ctx = UIGraphicsGetCurrentContext();
	CGContextSetInterpolationQuality(ctx, kCGInterpolationMedium);
	[self drawInRect:(CGRect){.size = size} blendMode:kCGBlendModeCopy alpha:1];
	uint8_t *data = CGBitmapContextGetData(ctx);
	UIColor *color = [UIColor colorWithRed:data[2] / 255.0f
									 green:data[1] / 255.0f
									  blue:data[0] / 255.0f
									 alpha:1];
	UIGraphicsEndImageContext();
	return color;
}

@end
