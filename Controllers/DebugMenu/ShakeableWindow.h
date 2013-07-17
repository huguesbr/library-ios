/**
 Create a window that will respond to a shake gesture and post a notification
 by default "motionShakeNotification", can be customize via shakeNotificationName property
 
 Created by Hugues BERNET-ROLLANDE on 12/15/11.
 Copyright (c) 2011 Comcast Silicon Valley. All rights reserved.
 */

#import <UIKit/UIKit.h>
#ifndef kMotionShakeNotification 
    #define kMotionShakeNotification @"motionShakeNotification"
#endif
@interface ShakeableWindow : UIWindow
{
    NSString *shakeNotificationName;
}
@property (nonatomic, copy) NSString *shakeNotificationName;
@end
