//
//  NSError+Extra.h
//  HBR
//
//  Created by Hugues Bernet-Rollande on 1/15/13.
//  Copyright (c) 2013 HBR. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSError (Extra)
+ (NSError *)errorWithDomain:(NSString *)domain code:(NSInteger)code localizedDescription:(NSString *)description;
@end
