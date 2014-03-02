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
    return [self showHUDReusedOrAddedTo:view labelText:nil animated:animated blocking:YES];
}

+ (MB_INSTANCETYPE)showHUDReusedOrAddedTo:(UIView *)view labelText:(NSString *)text animated:(BOOL)animated
{
    return [self showHUDReusedOrAddedTo:view labelText:text animated:animated blocking:YES];
}

+ (MB_INSTANCETYPE)showHUDReusedOrAddedTo:(UIView *)view labelText:(NSString *)text animated:(BOOL)animated blocking:(BOOL)blocking;
{
    id hud = [self HUDForView:view];
    if(!hud) hud = [self showHUDAddedTo:view animated:animated];
    if(text) [hud setLabelText:text];
    [hud setUserInteractionEnabled:!blocking];
    return hud;
}

@end
