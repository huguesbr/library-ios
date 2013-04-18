//
//  UIImageView+SpinnerRemoteImage.h
//  Yerdle
//
//  Created by Hugues Bernet-Rollande on 4/17/13.
//  Copyright (c) 2013 Hugues Bernet-Rollande. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (SpinnerRemoteImage)

- (void)setImageWithURL:(NSURL *)url andShowActivityIndicator:(BOOL)showActivityIndicator;
- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)image andShowActivityIndicator:(BOOL)showActivityIndicator;
- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)image fallbackImage:(UIImage *)fallbackImage andShowActivityIndicator:(BOOL)showActivityIndicator;

@end
