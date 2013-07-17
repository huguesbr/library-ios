//
//  DebugMenuDictionaryViewerController.h
//  BirthdayGram
//
//  Created by Hugues BERNET-ROLLANDE on 3/14/12.
//  Copyright (c) 2012 Comcast Silicon Valley. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DebugMenuDictionaryViewerController : UITableViewController
@property (retain, nonatomic) NSDictionary *dictionary;
@property (retain, nonatomic) NSArray *values;
@property (retain, nonatomic) NSArray *keys;
@property (retain, nonatomic) UITextView *detailTextView;
@property (retain, nonatomic) UIButton *hideDetailButton;
@property (assign) id object;
@end
