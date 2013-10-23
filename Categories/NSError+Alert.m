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
    if(_isShowingError) return;
    _isShowingError = YES;
    NSLog(@"description: %@", self.description);
    NSLog(@"localized: %@", self.localizedDescription);
    [UIAlertView showAlertViewWithTitle:title message:self.localizedDescription cancelButtonTitle:@"" otherButtonTitles:nil handler:^(UIAlertView *alertView, NSInteger buttonIndex) {
        _isShowingError = NO;
    }];
}

@end
