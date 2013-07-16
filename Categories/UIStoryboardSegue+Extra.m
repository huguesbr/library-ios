//
//  UIStoryboardSegue+Extra.m
//  yerdle2
//
//  Created by Hugues Bernet-Rollande on 7/2/13.
//  Copyright (c) 2013 Yerdle. All rights reserved.
//

#import "UIStoryboardSegue+Extra.h"

@implementation UIStoryboardSegue (Extra)

- (id)topLevelDestinationViewController
{
    id dest = self.destinationViewController;
    if ([dest isKindOfClass:[UINavigationController class]]) {
        UINavigationController* nav = dest;
        dest = nav.topViewController;
    }
    return dest;
}

@end
