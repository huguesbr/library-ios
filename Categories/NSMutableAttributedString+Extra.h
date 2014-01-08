//
//  NSMutableAttributedString+Extra.h
//  yerdle
//
//  Created by Hugues Bernet-Rollande on 1/8/14.
//  Copyright (c) 2014 Yerdle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableAttributedString (Extra)

- (void)addAttribute:(NSString *)name value:(id)value forString:(NSString *)string;

@end
