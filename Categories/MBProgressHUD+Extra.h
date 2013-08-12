//
//  MBProgressHUD+Extra.h
//  yerdle
//
//  Created by Hugues Bernet-Rollande on 8/9/13.
//  Copyright (c) 2013 Yerdle. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (Extra)

+ (MB_INSTANCETYPE)showHUDReusedOrAddedTo:(UIView *)view animated:(BOOL)animated;
+ (MB_INSTANCETYPE)showHUDReusedOrAddedTo:(UIView *)view labelText:(NSString *)text animated:(BOOL)animated;

@end
