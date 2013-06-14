//
//  NSObject+WeakSelf.h
//  HBR
//
//  Created by Hugues Bernet-Rollande on 1/21/13.
//  Copyright (c) 2013 HBR. All rights reserved.
//

#import <Foundation/Foundation.h>

#define Weakify(o) __weak __typeof__((__typeof__(o))o)
#define WeakifySelf(o) Weakify(self) o = self;

@interface NSObject (WeakSelf)

@property (weak, readonly) id weakSelf;

@end
