//
//  NSURL+QueryArguments.h
//  OneDebit
//
//  Created by Hugues Bernet-Rollande on 2/19/13.
//  Copyright (c) 2013 OneDebit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURL (QueryArguments)
- (NSDictionary *)queryDict;
@end
