//
//  UITextField+Empty.m
//  HBR
//
//  Created by Hugues Bernet-Rollande on 1/9/13.
//  Copyright (c) 2013 HBR. All rights reserved.
//

#import "UITextField+Empty.h"

@implementation UITextField (Empty)

- (BOOL)isEmpty;
{
    return !self.text || [self.text isEqualToString:@""];
}

@end
