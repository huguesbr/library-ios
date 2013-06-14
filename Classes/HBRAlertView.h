//
//  HBRAlertView.h
//  HBR
//
//  Created by Hugues Bernet-Rollande on 1/21/13.
//  Copyright (c) 2013 HBR. All rights reserved.
//

#import <UIKit/UIKit.h>

#ifndef kThemeLightColor
#define kThemeLightColor [UIColor lightGrayColor]
#endif

@protocol HBRAlertViewDelegate <UIAlertViewDelegate>

@end

@interface HBRAlertView : UIAlertView <HBRAlertViewDelegate>

@end
