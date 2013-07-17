//
//  ShakeableWindow.m
//  My Card
//
//  Created by Hugues BERNET-ROLLANDE on 12/15/11.
//  Copyright (c) 2011 Comcast Silicon Valley. All rights reserved.
//

#import "ShakeableWindow.h"
@implementation ShakeableWindow
@synthesize shakeNotificationName;

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        self.shakeNotificationName = kMotionShakeNotification;
    }
    return self;
}

-(void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if(motion == UIEventSubtypeMotionShake)
        [[NSNotificationCenter defaultCenter] postNotificationName:shakeNotificationName object:event];

}
@end
