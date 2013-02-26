//
//  NSObject+Swizzle.m
//  OneDebit
//
//  Created by Hugues Bernet-Rollande on 1/21/13.
//  Copyright (c) 2013 OneDebit. All rights reserved.
//

#import "NSObject+Swizzle.h"

#define kNSObjectSwizzlePrefix @"swizzle_"

@implementation NSObject (Swizzle)

- (void)swizzle:(Class)class methodName:(NSString*)methodName;
{
    SEL originalMethod = NSSelectorFromString(methodName);
    SEL newMethod = NSSelectorFromString([NSString stringWithFormat:@"%@%@", kNSObjectSwizzlePrefix, methodName]);
    [self swizzle:class from:originalMethod to:newMethod];
}

- (void)swizzle:(Class)class from:(SEL)original to:(SEL)new;
{
    Method originalMethod = class_getInstanceMethod(class, original);
    Method newMethod = class_getInstanceMethod(class, new);
    if(class_addMethod(class, original, method_getImplementation(newMethod), method_getTypeEncoding(newMethod))) {
        class_replaceMethod(class, new, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, newMethod);
    }
}

@end
