//
//  UIViewController+Extra.m
//  My Card
//
//  Created by Hugues BERNET-ROLLANDE on 12/16/11.
//  Copyright (c) 2011 Comcast Silicon Valley. All rights reserved.
//

#import "UIViewController+Modal.h"

@implementation UIViewController (Extra)

- (BOOL)isModal;
{
    return (self == [[[self navigationController] viewControllers] objectAtIndex:0]);
}

-(void)dismissTopViewControllerAnimated:(BOOL)flag completion:(void (^)(void))completion;
{
    if (self.navigationController) [self.navigationController.presentingViewController dismissViewControllerAnimated:flag completion:completion];
    else [self.presentingViewController dismissViewControllerAnimated:flag completion:completion];
}

@end
