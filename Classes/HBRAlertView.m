//
//  HBRAlertView.m
//  HBR
//
//  Created by Hugues Bernet-Rollande on 1/21/13.
//  Copyright (c) 2013 HBR. All rights reserved.
//

#import "HBRAlertView.h"
#import "UIView+Extra.h"

@implementation HBRAlertView


-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:(CGRect)frame];
    self.backgroundColor = kThemeLightColor;
    return self;
}

-(void)willMoveToSuperview:(UIView *)newSuperview
{
    [super willMoveToSuperview:newSuperview];
    [self makeRoundedCornerWithRadius:7. border:2. color:[UIColor whiteColor]];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
//    [self recursiveDescription];
    [self.subviews enumerateObjectsUsingBlock:^(UIView *subview, NSUInteger idx, BOOL *stop) {
        if ([subview isMemberOfClass:[UIImageView class]]) {
            // Hide UIImageView Containing Blue Background
            subview.hidden = YES;
        } else if ([subview isMemberOfClass:[UILabel class]]) {
            // Remove shadow on text
            UILabel *label = (UILabel *) subview;
            label.shadowOffset = CGSizeMake(0, 0); //
        } else if ([[subview class] isSubclassOfClass:[UITextField class]]) {
            // TODO: Set White border
        } else if ([[subview class] isSubclassOfClass:[UIButton class]]) {
            // Remove shadow on button
            UIButton *button = (UIButton *) subview;
#if kNUIEnabled
            [NUIRenderer renderButton:button withClass:@"Button"];
#endif
//            [button.subviews enumerateObjectsUsingBlock:^(UIView *view, NSUInteger idx, BOOL *stop) {
//                if([view isKindOfClass:[UIImageView class]]){
//                    view.hidden = YES;
//                }
//            }];
            button.titleLabel.shadowOffset = CGSizeMake(0, 0);
        }
    }];
}

@end
