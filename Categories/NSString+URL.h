//
//  NSString+URL.h
//  Prototype
//
//  Created by Hugues on 11/13/12.
//  Copyright (c) 2012 1debit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (URL)

/**
	Create an URL from the String
	@returns the URL from [NSURL urlWithString:self]
 */
- (NSURL *)urlValue;

@end
