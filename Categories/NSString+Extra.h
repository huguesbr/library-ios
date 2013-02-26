//
//  NSString+Extra.h
//  OneDebit
//
//  Created by Hugues Bernet-Rollande on 1/9/13.
//  Copyright (c) 2013 OneDebit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extra)

- (BOOL)contains:(NSString *)aString;
- (NSString*)stringByPrependingString:(NSString*)aString;
@end
