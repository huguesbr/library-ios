//
//  NSObject+Debug.m
//  OneDebit
//
//  Created by Hugues Bernet-Rollande on 1/25/13.
//  Copyright (c) 2013 OneDebit. All rights reserved.
//

#import "NSObject+Debug.h"
#import <objc/runtime.h>

@implementation NSObject (Debug)

- (void)logProperties;
{
    
    NSLog(@"----------------------------------------------- Properties for object %@", self);
    
    @autoreleasepool {
        unsigned int numberOfProperties = 0;
        objc_property_t *propertyArray = class_copyPropertyList([self class], &numberOfProperties);
        for (NSUInteger i = 0; i < numberOfProperties; i++) {
            objc_property_t property = propertyArray[i];
            NSString *name = [[NSString alloc] initWithUTF8String:property_getName(property)];
            NSLog(@"Property %@ Value: %@", name, [self valueForKey:name]);
        }
        free(propertyArray);
    }
    NSLog(@"-----------------------------------------------");
}

- (void)logIvars;
{
    unsigned int count;
    Ivar *ivars = class_copyIvarList([self class], &count);
    for (unsigned int i = 0; i < count; i++) {
        Ivar ivar = ivars[i];
        
        const char *name = ivar_getName(ivar);
        const char *type = ivar_getTypeEncoding(ivar);
        ptrdiff_t offset = ivar_getOffset(ivar);
        
        if (strncmp(type, "i", 1) == 0) {
            int intValue = *(int*)((uintptr_t)self + offset);
            NSLog(@"%s = %i", name, intValue);
        } else if (strncmp(type, "f", 1) == 0) {
            float floatValue = *(float*)((uintptr_t)self + offset);
            NSLog(@"%s = %f", name, floatValue);
        } else if (strncmp(type, "@", 1) == 0) {
            id value = object_getIvar(self, ivar);
            NSLog(@"%s = %@", name, value);
        }
        // And the rest for other type encodings
    }
    free(ivars);
}

@end
