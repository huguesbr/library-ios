//
//  NSError+Alert.m
//  Muse
//
//  Created by Hugues on 8/15/12.
//  Copyright (c) 2012 Comcast Silicon Valley. All rights reserved.
//

#import "NSError+Alert.h"

#import "UIAlertView+Alert.h"

@implementation NSError (Alert)

- (void)show
{
    [self showWithTitle:@"Error"];
}

- (void)showWithTitle:(NSString *)title
{
    [UIAlertView showAlertViewWithTitle:title message:[self localizedDescription]];
}

@end
