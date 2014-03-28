//
//  NSError+Alert.m
//  Muse
//
//  Created by Hugues on 8/15/12.
//  Copyright (c) 2012 Comcast Silicon Valley. All rights reserved.
//

#import "NSError+Alert.h"
#import <UIAlertView+BlocksKit.h>
#import "UIAlertView+Alert.h"

@implementation NSError (Alert)

static BOOL _isShowingError;

- (void)show
{
    [self showWithTitle:@"Error"];
}

- (void)showWithTitle:(NSString *)title
{
    [self showWithTitle:title actionButtonTitle:nil handler:nil];
}

- (void)showWithTitle:(NSString *)title actionButtonTitle:(NSString *)actionButtonTitle handler:( void(^)() )handler;
{
    [self showWithTitle:title dismissButtonTitle:k$(@"Dismiss") actionButtonTitle:actionButtonTitle handler:handler];
}

- (void)showWithTitle:(NSString *)title dismissButtonTitle:(NSString *)dismissButtonTitle actionButtonTitle:(NSString *)actionButtonTitle handler:( void(^)() )handler;
{
    if(_isShowingError) return;
    _isShowingError = YES;
    NSLog(@"description: %@", self.description);
    NSTrack(@"localized: %@", self.localizedDescription);
    YDAlertView *alertView = [YDAlertView bk_alertViewWithTitle:title message:self.localizedDescription];
    if(dismissButtonTitle) {
        [alertView bk_setCancelButtonWithTitle:dismissButtonTitle handler:^{
            _isShowingError = NO;
        }];
    }
    if(actionButtonTitle) {
        [alertView bk_addButtonWithTitle:actionButtonTitle handler:^{
            _isShowingError = NO;
            if(handler) handler();
        }];
    }
    [alertView show];
}

@end
