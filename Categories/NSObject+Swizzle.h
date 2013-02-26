//
//  NSObject+Swizzle.h
//  OneDebit
//
//  Created by Hugues Bernet-Rollande on 1/21/13.
//  Copyright (c) 2013 OneDebit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Swizzle)

- (void)swizzle:(Class)class methodName:(NSString*)methodName;
- (void)swizzle:(Class)class from:(SEL)original to:(SEL)new;

@end
