//
//  NSError+Extra.h
//  HBR
//
//  Created by Hugues Bernet-Rollande on 1/15/13.
//  Copyright (c) 2013 HBR. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSError (Extra)
@property (readonly, nonatomic) NSError *underlyingError;
@property (readonly, nonatomic) NSString *recursiveDescription;
@property (readonly, nonatomic) BOOL isNotConnectedToInternetError;
- (BOOL)isDomain:(NSString *)domain code:(NSInteger)code;
- (BOOL)isDomain:(NSString *)domain;

+ (instancetype)errorWithDomain:(NSString *)domain code:(NSInteger)code localizedDescription:(NSString *)description;
+ (instancetype)errorWithDomain:(NSString *)domain code:(NSInteger)code localizedDescription:(NSString *)description underlyingError:(NSError *)underlyingError;
+ (instancetype)errorWithDomain:(NSString *)domain code:(NSInteger)code userInfo:(NSDictionary *)dict underlyingError:(NSError *)underlyingError;
@end
