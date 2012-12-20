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

@implementation UIImageView (Extra)

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    if(!self.layer.cornerRadius){
        [self makeRoundedCornerWithRadius:5. border:.2];
    }
}

@end
