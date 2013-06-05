//
//  NSDate+Formatted.m
//  OneDebit
//
//  Created by Hugues Bernet-Rollande on 1/23/13.
//  Copyright (c) 2013 OneDebit. All rights reserved.
//

#import "NSDate+Formatted.h"
#import "NSObject+AssociatedObject.h"
#import "NSDate+Formatter.h"

#define kNSDateFormattedFormat ""

@implementation NSDate (Formatted)


-(void)setFormat:(NSString *)format
{
    [self setAssociatedObject:format forKey:kNSDateFormattedFormat];
}

-(NSString *)format
{
    return [self associatedObjectforKey:kNSDateFormattedFormat];
}

-(NSString *)formatted
{
    NSString *formatted;
    if(self.format){
        formatted = [self stringWithFormat:self.format];
    } else {
        formatted = [self string];
    }
    return formatted;
}


@end
