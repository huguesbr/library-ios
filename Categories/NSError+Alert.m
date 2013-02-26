//
//  NSError+Alert.m
//  Muse
//
//  Created by Hugues on 8/15/12.
//  Copyright (c) 2012 Comcast Silicon Valley. All rights reserved.
//

#import "NSError+Alert.h"

#import <UIAlertView+BlocksKit.h>

@implementation NSError (Alert)

- (void)show
{
    [self showWithTitle:@"Error"];
}

- (void)showWithTitle:(NSString *)title
{
#if DEBUG
    [HBRAlertView showAlertViewWithTitle:title message:[self localizedDescription] cancelButtonTitle:@"Dismiss" otherButtonTitles:@[@"Debug"] handler:^(UIAlertView *alert, NSInteger buttonIndex) {
        if(buttonIndex != 0){ // Debug
            [HBRAlertView showAlertViewWithTitle:[self localizedFailureReason] message:self.userInfo[@"backtrace"]];
        }
    }];
#else
    [UIAlertView showAlertViewWithTitle:title message:[self localizedDescription]];
#endif
}

@end
