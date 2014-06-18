//
//  UIActivityIndicatorView+Start.m
//  Yerdle
//
//  Created by Hugues Bernet-Rollande on 4/17/13.
//  Copyright (c) 2013 Hugues Bernet-Rollande. All rights reserved.
//

#import "UIActivityIndicatorView+Start.h"

@implementation UIActivityIndicatorView (Start)

+ (id)activityIndicatorStarted;
{
    return [self activityIndicatorStartedWithActivityIndicatorStyle:kUIActivityIndicatorViewStyleDefault];
}

+ (id)activityIndicatorStartedWithActivityIndicatorStyle:(UIActivityIndicatorViewStyle)style;
{
    UIActivityIndicatorView *activity = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:style];
    [activity startAnimating];
    return activity;
}

@end
