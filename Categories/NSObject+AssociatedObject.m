//
//  NSObject+Associate.m
//  Muse
//
//  Created by Hugues on 8/10/12.
//  Copyright (c) 2012 Comcast Silicon Valley. All rights reserved.
//

#import "NSObject+AssociatedObject.h"
#import <objc/runtime.h>

@implementation NSObject (AssociatedObject)

- (void)setAssociatedObject:(id)object forKey:(const void *)key;
{
    objc_setAssociatedObject (self, key, object, OBJC_ASSOCIATION_RETAIN);
}

- (id)associatedObjectforKey:(const void *)key;
{
    return objc_getAssociatedObject(self, key);
}

- (void)removeAssociatedObjectForKey:(const void *)key;
{
    [self setAssociatedObject:nil forKey:key];
}

- (void)removeAssociatedObjects;
{
    objc_removeAssociatedObjects(self);
}

@end