//
//  UILabel+Boldify.m
//  yerdle
//
//  Created by Hugues Bernet-Rollande on 1/7/14.
//  Copyright (c) 2014 Yerdle. All rights reserved.
//

#import "UITableViewCell+AccessoryButton.h"

@implementation UITableViewCell (AccessoryButton)

- (UIButton *)accessoryButton
{
    if([self.accessoryView isKindOfClass:[UIButton class]]) {
        return (UIButton *)self.accessoryView;
    }
    return nil;
}

- (void)setAccessoryButton:(UIButton *)accessoryButton
{
    self.accessoryView = accessoryButton;
    [self.accessoryButton addTarget:self action:@selector(checkButtonTapped:event:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)checkButtonTapped:(id)sender event:(id)event
{
    UITableView *tableView = (UITableView *)self.superview;
    while(![tableView isKindOfClass:[UITableView class]]) {
        tableView = (UITableView *)tableView.superview;
    }
    [tableView.delegate tableView:tableView accessoryButtonTappedForRowWithIndexPath:[tableView indexPathForCell:self]];
}
@end
