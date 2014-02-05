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
    [self showWithTitle:title actionTitle:nil handler:nil];
}

- (void)showWithTitle:(NSString *)title actionTitle:(NSString *)actionTitle handler:( void(^)() )handler;
{
    [self showWithTitle:title dismiss:@"" actionTitle:actionTitle handler:handler];
}

- (void)showWithTitle:(NSString *)title dismiss:(NSString *)dismissTitle actionTitle:(NSString *)actionTitle handler:( void(^)() )handler;
{
    if(_isShowingError) return;
    _isShowingError = YES;
    NSLog(@"description: %@", self.description);
    NSLog(@"localized: %@", self.localizedDescription);
    NSArray *buttons = actionTitle ? @[actionTitle] : nil;
    [UIAlertView showAlertViewWithTitle:title message:self.localizedDescription cancelButtonTitle:dismissTitle otherButtonTitles:buttons handler:^(UIAlertView *alertView, NSInteger buttonIndex) {
        if (buttonIndex && handler) handler();
        _isShowingError = NO;
    }];
}

@end
