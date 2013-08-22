//
//  DebugMenuController.h
//  Tunerfish
//
//  Created by Josh Kennedy on 9/2/11.
//  Copyright 2011 Plaxo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DebugMenuRibbonController : UINavigationController
+ (instancetype)initWithDelegate:(id <UITableViewDelegate, UITableViewDataSource>)delegate;
+ (DebugMenuRibbonController *)sharedDebugMenu;
- (void) showHideRibbon;
- (void) hideDebugMenu;
@end
