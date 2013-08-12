//
//  MBProgressHUD+Extra.m
//  yerdle
//
//  Created by Hugues Bernet-Rollande on 8/9/13.
//  Copyright (c) 2013 Yerdle. All rights reserved.
//

#import "MBProgressHUD+Extra.h"

@implementation MBProgressHUD (Extra)

+ (MB_INSTANCETYPE)showHUDReusedOrAddedTo:(UIView *)view animated:(BOOL)animated;
{
    id hud = [self HUDForView:view];
    if(!hud) hud = [self showHUDAddedTo:view animated:animated];
    return hud;
}

+ (MB_INSTANCETYPE)showHUDReusedOrAddedTo:(UIView *)view labelText:(NSString *)text animated:(BOOL)animated;
{
    id hud = [self showHUDReusedOrAddedTo:view animated:animated];
    [hud setLabelText:text];
    return hud;
}

@end
