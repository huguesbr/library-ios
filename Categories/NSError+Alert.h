//
//  NSError+Alert.h
//  Muse
//
//  Created by Hugues on 8/15/12.
//  Copyright (c) 2012 Comcast Silicon Valley. All rights reserved.
//

/**
 Add methods to display an error directly from error object (alert view)
 */

#import <Foundation/Foundation.h>

@interface NSError (Alert)

- (void)show;
- (void)showWithTitle:(NSString *)title;

@end
