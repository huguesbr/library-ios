//
//  TFLargeGreenButton.m
//  Tunerfish
//
//  Created by Scott Eklund on 6/21/11.
//  Copyright 2011 Plaxo. All rights reserved.
//

#import "TFLargeGreenButton.h"

#define kLargeGreenButtonBgImage				@"large-green-scalable.png"
#define kLargeGreenButtonLeftCap				16
#define kLargeGreenButtonTopCap					0

@implementation TFLargeGreenButton

+ (id) buttonWithTitle:(NSString *)title
{
	TFLargeGreenButton *button = [TFLargeGreenButton buttonWithType:UIButtonTypeCustom];

	UIImage *img = [UIImage imageNamed:kLargeGreenButtonBgImage];
	UIImage *scalableImg = [img stretchableImageWithLeftCapWidth:kLargeGreenButtonLeftCap topCapHeight:kLargeGreenButtonTopCap];
		
	[button setBackgroundImage:scalableImg forState:UIControlStateNormal];
	[button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
	[button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateSelected];
	[button setTitle:title forState:UIControlStateNormal];

	return button;
}

@end
