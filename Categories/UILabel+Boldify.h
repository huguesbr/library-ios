//
//  UILabel+Boldify.h
//  yerdle
//
//  Created by Hugues Bernet-Rollande on 1/7/14.
//  Copyright (c) 2014 Yerdle. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Boldify)
- (void) boldSubstring: (NSString*) substring;
- (void) boldRange: (NSRange) range;
@end
