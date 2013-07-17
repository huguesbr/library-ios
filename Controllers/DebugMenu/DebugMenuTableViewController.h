//
//  DebugMenuTableViewController.h
//  Tunerfish
//
//  Created by Josh Kennedy on 9/7/11.
//  Copyright 2011 Plaxo. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DebugMenuDelegate

-(void) didClickExit;

@end

@interface DebugMenuTableViewController : UITableViewController <UIActionSheetDelegate> {

}

@property (nonatomic,assign) id<DebugMenuDelegate> delegate;

-(void) didClickExit;

@end
