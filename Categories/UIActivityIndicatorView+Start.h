//
//  UIActivityIndicatorView+Start.h
//  Yerdle
//
//  Created by Hugues Bernet-Rollande on 4/17/13.
//  Copyright (c) 2013 Hugues Bernet-Rollande. All rights reserved.
//

#import <UIKit/UIKit.h>

#ifndef kUIActivityIndicatorViewStyleDefault
#define kUIActivityIndicatorViewStyleDefault UIActivityIndicatorViewStyleWhite
#endif

@interface UIActivityIndicatorView (Start)

+ (id)activityIndicatorStarted;
+ (id)activityIndicatorStartedWithActivityIndicatorStyle:(UIActivityIndicatorViewStyle)style;

@end
