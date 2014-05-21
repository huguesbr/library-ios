//
//  CALayer+Storyboard.m
//  yerdle
//
//  Created by Hugues Bernet-Rollande on 5/21/14.
//  Copyright (c) 2014 Yerdle. All rights reserved.
//

#import "CALayer+Storyboard.h"
#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

@implementation CALayer (Storyboard)

-(void)setBorderUIColor:(UIColor*)color
{
    self.borderColor = color.CGColor;
}

-(UIColor*)borderUIColor
{
    return [UIColor colorWithCGColor:self.borderColor];
}

@end