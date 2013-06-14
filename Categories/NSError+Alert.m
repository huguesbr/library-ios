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
    NSLog(@"description: %@", self.description);
    NSLog(@"localized: %@", self.localizedDescription);
//#if DEBUG
//    [UIAlertView showAlertViewWithTitle:title message:self.localizedDescription cancelButtonTitle:@"Dismiss" otherButtonTitles:@[@"Debug"] handler:^(UIAlertView *alert, NSInteger buttonIndex) {
//        if(buttonIndex != 0){ // Debug
////            [UIAlertView showAlertViewWithTitle::self.localizedDescription message:self.userInfo[@"backtrace"]];
//        }
//    }];
//#else
    [UIAlertView showAlertViewWithTitle:title message:self.localizedDescription];
//#endif
}

@end
