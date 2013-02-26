//
//  UITableViewCell+aSyncImage.h
//  Qoin
//
//  Created by Hugues Bernet-Rollande on 2/25/13.
//  Copyright (c) 2013 OneDebit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (aSyncImage)

-(void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)image;

@end
