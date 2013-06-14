//
//  UIImageView+SpinnerRemoteImage.m
//  Yerdle
//
//  Created by Hugues Bernet-Rollande on 4/17/13.
//  Copyright (c) 2013 Hugues Bernet-Rollande. All rights reserved.
//

#import "UIImageView+SpinnerRemoteImage.h"
#import "UIView+Activity.h"
#import <AFNetworking/UIImageView+AFNetworking.h>

@implementation UIImageView (SpinnerRemoteImage)

- (void)setImageWithURL:(NSURL *)url andShowActivityIndicator:(BOOL)showActivityIndicator;
{
    [self setImageWithURL:url placeholderImage:nil andShowActivityIndicator:showActivityIndicator];
}

- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)image andShowActivityIndicator:(BOOL)showActivityIndicator;
{
    [self setImageWithURL:url placeholderImage:image fallbackImage:nil andShowActivityIndicator:showActivityIndicator];
}

- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)image fallbackImage:(UIImage *)fallbackImage andShowActivityIndicator:(BOOL)showActivityIndicator;
{
    if(showActivityIndicator) [self startActivityIndicator];
    void (^setImage)(UIImage *) = ^(UIImage *image){
        self.image = image;
        [self setNeedsDisplay];
        if(showActivityIndicator) [self stopActivityIndicator];
    };
    [self setImageWithURLRequest:[NSMutableURLRequest requestWithURL:url] placeholderImage:image success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
        setImage(image);
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
        setImage(fallbackImage);
    }];
}

@end
