//
//  ShakeableWindow.m
//  My Card
//
//  Created by Hugues BERNET-ROLLANDE on 12/15/11.
//  Copyright (c) 2011 Comcast Silicon Valley. All rights reserved.
//

#import "ShakeableWindow.h"

@implementation ShakeableWindow

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
    }
    return self;
}

-(BOOL)canBecomeFirstResponder
{
    return YES;
}

-(void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if(motion == UIEventSubtypeMotionShake)
        [[NSNotificationCenter defaultCenter] postNotificationName:kShakeableWindowDidShakeNotification object:event];

}

@end
