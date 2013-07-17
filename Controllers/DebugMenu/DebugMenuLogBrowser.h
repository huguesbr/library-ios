//
//  DebugMenuLogBrowser.h
//  Tunerfish
//
//  Created by Josh Kennedy on 9/14/11.
//  Copyright 2011 Plaxo. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DebugMenuLogBrowser : UITableViewController {

	NSMutableArray* _logMessages;
	
}

@property (nonatomic,retain) NSMutableArray* logMessages;

@end
