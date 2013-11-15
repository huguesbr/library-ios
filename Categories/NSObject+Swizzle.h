//
//  NSObject+Swizzle.h
//  HBR
//
//  Created by Hugues Bernet-Rollande on 1/21/13.
//  Copyright (c) 2013 HBR. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Swizzle)

+ (void)swizzleInstanceSelector:(SEL)firstSelector toSelector:(SEL)secondSelector;
+ (void)swizzleClassSelector:(SEL)firstSelector toSelector:(SEL)secondSelector;

- (void)swizzle:(Class)class methodName:(NSString*)methodName;
- (void)swizzle:(Class)class from:(SEL)original to:(SEL)new;

@end
