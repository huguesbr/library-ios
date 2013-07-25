//
//  DebugMenuController.h
//  Tunerfish
//
//  Created by Josh Kennedy on 9/2/11.
//  Copyright 2011 Plaxo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DebugMenuTableViewController.h"

#ifndef kMotionShakeNotification
#define kMotionShakeNotification @"motionShakeNotification"
#endif

@interface DebugMenuRibbonController : UINavigationController<DebugMenuDelegate>{

	BOOL _ribbonIsDown;
	
}

@property (nonatomic,retain) UIButton* ribbon;

-(void) addDebugIndicatorToWindow;

+(DebugMenuRibbonController*) activateDebugMenu;

+(void) moveRibbonToTopOfWindow;

@end