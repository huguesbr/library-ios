//
//  NSOperationQueue+Extra.h
//  yerdle2
//
//  Created by Hugues Bernet-Rollande on 8/5/13.
//  Copyright (c) 2013 Yerdle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSOperationQueue (Extra)
- (void)addCompletionBlock:( void(^)() )completionBlock;
@end
