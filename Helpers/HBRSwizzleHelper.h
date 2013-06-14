//
//  HBRSwizzleHelper.h
//  HBR
//
//  Created by Hugues Bernet-Rollande on 1/7/13.
//  Copyright (c) 2013 HBR. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HBRSwizzleHelper : NSObject

+ (void)swizzleMethod:(SEL)anOriginMethod withMethod:(SEL)aNewMethod onClass:(Class)aClass;

@end
