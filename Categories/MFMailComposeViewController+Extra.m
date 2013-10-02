//
//  MFMailComposeViewController+Extra.m
//  yerdle
//
//  Created by Hugues Bernet-Rollande on 10/2/13.
//  Copyright (c) 2013 Yerdle. All rights reserved.
//

#import "MFMailComposeViewController+Extra.h"

@implementation MFMailComposeViewController (Extra)
- (void)presentOrFailFromViewController:(UIViewController *)controller animated:(BOOL)animated
{
    if([[self class] canSendMail]) {
        [controller presentViewController:self animated:animated completion:nil];
    } else {
        [UIAlertView showAlertViewWithTitle:k$(@"Enable to send email") message:k$(@"You need to configure the mail app on your phone")];
    }
}
@end
