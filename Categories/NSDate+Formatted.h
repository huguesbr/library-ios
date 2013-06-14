//
//  NSDate+Formatted.h
//  HBR
//
//  Created by Hugues Bernet-Rollande on 1/23/13.
//  Copyright (c) 2013 HBR. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Formatted)
@property (strong) NSString *format;
@property (readonly, weak) NSString *formatted;
@end
