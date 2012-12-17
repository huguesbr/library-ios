//
//  PXCapButton.m
//  My Card
//
//  Created by Hugues BERNET-ROLLANDE on 12/2/11.
//  Copyright (c) 2011 Comcast Silicon Valley. All rights reserved.
//

#import "PXCapButton.h"

@implementation PXCapButton

-(void)awakeFromNib
{
    [self setBackgroundImage:[self backgroundImageForState:UIControlStateNormal] forState:UIControlStateNormal];
    [self setBackgroundImage:[self backgroundImageForState:UIControlStateDisabled] forState:UIControlStateDisabled];
    [self setBackgroundImage:[self backgroundImageForState:UIControlStateHighlighted] forState:UIControlStateHighlighted];
    [self setBackgroundImage:[self backgroundImageForState:UIControlStateSelected] forState:UIControlStateSelected];
}

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont boldSystemFontOfSize:20];
        self.titleLabel.shadowColor = [UIColor lightGrayColor];
        self.titleLabel.shadowOffset = CGSizeMake(0, -1);
    }
    return self;
}

-(void)setBackgroundImage:(UIImage *)image forState:(UIControlState)state
{
    [super setBackgroundImage:
     [image stretchableImageWithLeftCapWidth:kPXCapButtonLeftCapWidth topCapHeight:kPXCapButtonLeftCapHeight] 
                     forState:state];
}



@end
