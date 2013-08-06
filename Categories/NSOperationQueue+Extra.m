//
//  NSOperationQueue+Extra.m
//  yerdle2
//
//  Created by Hugues Bernet-Rollande on 8/5/13.
//  Copyright (c) 2013 Yerdle. All rights reserved.
//

#import "NSOperationQueue+Extra.h"

@implementation NSOperationQueue (Extra)

- (void)addCompletionBlock:( void(^)() )completionBlock;
{
    NSBlockOperation *doneOperation = [NSBlockOperation blockOperationWithBlock:completionBlock];
    [[self operations] enumerateObjectsUsingBlock:^(NSOperation *operation, NSUInteger idx, BOOL *stop) {
        [doneOperation addDependency:operation];
    }];
    [self addOperation:doneOperation];
}

@end
