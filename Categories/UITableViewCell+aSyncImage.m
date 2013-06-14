//
//  UITableViewCell+aSyncImage.m
//  Qoin
//
//  Created by Hugues Bernet-Rollande on 2/25/13.
//  Copyright (c) 2013 HBR. All rights reserved.
//

#import "UITableViewCell+aSyncImage.h"
#import <AFNetworking/UIImageView+AFNetworking.h>

@implementation UITableViewCell (aSyncImage)

-(void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)image;
{
    __weak UITableViewCell *weakSelf = self;
    [self.imageView setImageWithURLRequest:[NSURLRequest requestWithURL:url]  placeholderImage:image success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
        weakSelf.imageView.image = image;
        [weakSelf setNeedsLayout];
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
        weakSelf.imageView.image = nil;
        [weakSelf setNeedsLayout];
    }];
}

@end
