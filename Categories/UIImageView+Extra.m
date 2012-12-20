//
//  UIImageView+Extra.m
//  OneDebit
//
//  Created by Hugues Bernet-Rollande on 12/19/12.
//  Copyright (c) 2012 OneDebit. All rights reserved.
//

#import "UIImageView+Extra.h"
#import "UIView+Extra.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIImageView (RoundedCellImageView)

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    UIView *superview = self.superview;
    while(superview){
        if([superview isKindOfClass:[UITableViewCell class]]) {
            NSLog(@"radius: %g", self.layer.cornerRadius);
//            if(self.layer.cornerRadius != 5.) {
                [self makeRoundedCornerWithRadius:5. border:.2];
//            }
            break;
        } else {
            superview = superview.superview;
        }
    }
}

@end
