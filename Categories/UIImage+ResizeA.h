//
//  UIImage+Resize.h
//  yerdle
//
//  Created by Hugues Bernet-Rollande on 8/20/13.
//  Copyright (c) 2013 Yerdle. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ResizeA)

- (UIImage*)imageByScalingAndCroppingForSize:(CGSize)targetSize;
@end
