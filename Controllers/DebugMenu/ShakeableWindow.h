/**
 Create a window that will respond to a shake gesture and post a notification "ShakeableWindowDidShakeNotification"
 
 Created by Hugues BERNET-ROLLANDE on 12/15/11.
 Copyright (c) 2011 Hugues Bernet-Rollande. All rights reserved.
 */

#import <UIKit/UIKit.h>
#ifndef kShakeableWindowDidShakeNotification
    #define kShakeableWindowDidShakeNotification @"ShakeableWindowDidShakeNotification"
#endif
@interface ShakeableWindow : UIWindow
@end
