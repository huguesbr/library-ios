//
//  UIViewController+Extra.h
//  My Card
//
//  Created by Hugues BERNET-ROLLANDE on 12/16/11.
//  Copyright (c) 2011 Comcast Silicon Valley. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Extra)

- (BOOL)isModal;
- (void)dismissTopViewControllerAnimated:(BOOL)flag completion:(void (^)(void))completion;

@end
