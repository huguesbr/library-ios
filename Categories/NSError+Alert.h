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
- (void)showWithTitle:(NSString *)title actionButtonTitle:(NSString *)actionButtonTitle handler:( void(^)() )handler;
- (void)showWithTitle:(NSString *)title dismissButtonTitle:(NSString *)dismissButtonTitle actionButtonTitle:(NSString *)actionButtonTitle handler:( void(^)() )handler;

@end
