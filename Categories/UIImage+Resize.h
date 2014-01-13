//
//  UIImage+Resize.h
//  yerdle
//
//  Created by Hugues Bernet-Rollande on 8/20/13.
//  Copyright (c) 2013 Yerdle. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Resize)

- (UIImage*)imageByScalingAndCroppingForSize:(CGSize)targetSize;
@end
