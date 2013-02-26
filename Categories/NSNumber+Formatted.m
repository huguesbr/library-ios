//
//  NSNumber+Formatted.m
//  OneDebit
//
//  Created by Hugues Bernet-Rollande on 1/23/13.
//  Copyright (c) 2013 OneDebit. All rights reserved.
//

#import "NSNumber+Formatted.h"
#import "NSObject+AssociatedObject.h"
#import "HBRNumberFormatter.h"
#import "HBRDebugHelper.h"


#define kNSNumberFormattedFormat ""

@implementation NSNumber (Formatted)

-(void)setFormat:(NSString *)format
{
    [self setAssociatedObject:format forKey:kNSNumberFormattedFormat];
}

-(NSString *)format
{
    return [self associatedObjectforKey:kNSNumberFormattedFormat];
}

-(NSString *)formatted
{
    NSString *formatted;
    NSString *format = self.format;
    if(format) {
        NSString *formatSelString = [NSString stringWithFormat:@"formatAs%@", format];
        SEL formatSel = NSSelectorFromString(formatSelString);
        if ([self respondsToSelector:formatSel]) {
            SuppressPerformSelectorLeakWarning(formatted = [self performSelector:formatSel];);
        } else {
            formatted = [self stringValue];
        }
    } else {
//        NSLog(@"no format for: %@", self);
        formatted = [self stringValue];
    }
    return formatted;
}

- (NSString *)formatAsPhoneNumber
{
    return [[HBRNumberFormatter defaultFormatter] stringForObjectValue:[self stringValue]];
}

- (NSString *)formatAsSocialSecurityNumber
{
    NSString *socialSecurityNumberFormatted = @"";
    NSString *socialSecurityNumberString = [self stringValue];
    if(socialSecurityNumberString){
        NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"(.{3})(.{3})(.{4})" options:NSRegularExpressionCaseInsensitive error:nil];
        socialSecurityNumberFormatted = [regex stringByReplacingMatchesInString:socialSecurityNumberString options:0 range:NSMakeRange(0, [socialSecurityNumberString length]) withTemplate:@"$1-$2-$3"];
    }
    return socialSecurityNumberFormatted;
}

- (NSString *)formatAsCurrency
{
    return [self stringWithNumberStyle:NSNumberFormatterCurrencyStyle];
}

@end
