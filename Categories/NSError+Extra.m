//
//  NSError+Extra.m
//  HBR
//
//  Created by Hugues Bernet-Rollande on 1/15/13.
//  Copyright (c) 2013 HBR. All rights reserved.
//

#import "NSError+Extra.h"

@implementation NSError (Extra)


- (BOOL)isDomain:(NSString *)domain code:(NSInteger)code
{
    return ([self isDomain:domain] && self.code == code);
}

- (BOOL)isDomain:(NSString *)domain
{
    return [self.domain isEqualToString:domain];
}

- (BOOL)isNotConnectedToInternetError;
{
    return [self isDomain:NSURLErrorDomain code:NSURLErrorNotConnectedToInternet];
}

- (NSError *)underlyingError
{
    return self.userInfo[NSUnderlyingErrorKey];
}

- (NSString *)recursiveDescription;
{
    NSString *recursiveDescription = [self description];
    if(self.underlyingError) recursiveDescription = [recursiveDescription stringByAppendingFormat:@"\n%@", self.underlyingError.recursiveDescription];
    return recursiveDescription;
}

+ (NSError *)errorWithDomain:(NSString *)domain code:(NSInteger)code localizedDescription:(NSString *)description;
{
    NSDictionary *userInfo;
    if(description) userInfo = @{NSLocalizedDescriptionKey: description};
    return [NSError errorWithDomain:domain code:code userInfo:userInfo];
}

+ (instancetype)errorWithDomain:(NSString *)domain code:(NSInteger)code localizedDescription:(NSString *)description underlyingError:(NSError *)underlyingError;
{
    NSDictionary *userInfo;
    if(description) userInfo = @{NSLocalizedDescriptionKey: description};
    return [NSError errorWithDomain:domain code:code userInfo:userInfo underlyingError:underlyingError];
}

+ (instancetype)errorWithDomain:(NSString *)domain code:(NSInteger)code userInfo:(NSDictionary *)dict underlyingError:(NSError *)underlyingError
{
    NSMutableDictionary *userInfo = [NSMutableDictionary dictionaryWithDictionary:dict];
    if(underlyingError) userInfo[NSUnderlyingErrorKey] = underlyingError;
    return[self errorWithDomain:domain code:code userInfo:userInfo];
}

@end
