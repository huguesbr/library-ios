//
//  MFMailComposeViewController+Extra.h
//  yerdle
//
//  Created by Hugues Bernet-Rollande on 10/2/13.
//  Copyright (c) 2013 Yerdle. All rights reserved.
//

#import <MessageUI/MessageUI.h>

@interface MFMailComposeViewController (Extra)
- (void)presentOrFailFromViewController:(UIViewController *)controller animated:(BOOL)animated;

@end
