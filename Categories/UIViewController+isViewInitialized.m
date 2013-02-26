//
//  UIViewController+FirstAppear.m
//  OneDebit
//
//  Created by Hugues Bernet-Rollande on 1/7/13.
//  Copyright (c) 2013 OneDebit. All rights reserved.
//

#import "UIViewController+isViewInitialized.h"

#import "NSObject+AssociatedObject.h"

static char const * const kIsViewInitializedKey = "isViewInitialized";

@implementation UIViewController (isViewInitialized)

-(void)setIsViewInitialized:(BOOL)isViewInitialized
{
    [self setAssociatedObject:@(isViewInitialized) forKey:kIsViewInitializedKey];
}

-(BOOL)isViewInitialized
{
    return [[self associatedObjectforKey:kIsViewInitializedKey] boolValue];
}

@end



