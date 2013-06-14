//
//  NSObject+Debug.h
//  HBR
//
//  Created by Hugues Bernet-Rollande on 1/25/13.
//  Copyright (c) 2013 HBR. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Debug)

- (void)logProperties;
- (void)logIvars;

@end
