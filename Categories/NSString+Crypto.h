//
//  NSString+Crypto.h
//  yerdle2
//
//  Created by Hugues Bernet-Rollande on 7/23/13.
//  Copyright (c) 2013 Yerdle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Crypto)

- (NSString *)sha1;
- (NSString *)sha256;
- (NSString *)md5;

@end
