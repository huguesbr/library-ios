//
//  UIButton+Image.m
//  Muse
//
//  Created by Hugues Bernet Rollande on 9/20/12.
//  Copyright (c) 2012 Comcast Silicon Valley. All rights reserved.
//


#import "UIButton+Image.h"
#import "HBRNSStringHelper.h"

@implementation UIButton (Image)

- (id)initWithImageNamed:(NSString *)imageNamed forStates:(UIControlState)states;
{
    NSMutableDictionary *statesDict = [@{} mutableCopy];
    
    if( (states & UIControlStateNormal) == UIControlStateNormal) {
        [statesDict setValue:kUIControlStateNormalImageSuffix forKey:NSMakeStringWithFormat(@"%d", UIControlStateNormal)];
    }
    
    if( (states & UIControlStateSelected) == UIControlStateSelected) {
        [statesDict setValue:kUIControlStateSelectedImageSuffix forKey:NSMakeStringWithFormat(@"%d",UIControlStateSelected)];
    }
    
    if( (states & UIControlStateDisabled) == UIControlStateDisabled) {
        [statesDict setValue:kUIControlStateDisabledImageSuffix forKey:NSMakeStringWithFormat(@"%d",UIControlStateDisabled)];
    }
    
    if( (states & UIControlStateHighlighted) == UIControlStateHighlighted) {
        [statesDict setValue:kUIControlStateHighlightedImageSuffix forKey:NSMakeStringWithFormat(@"%d",UIControlStateHighlighted)];
    }
    
    return [self initWithImageNamed:imageNamed forStatesSuffix:statesDict];
}

- (id)initWithImageNamed:(NSString *)imageNamed forStatesSuffix:(NSDictionary *)suffixes;
{
    self = [super init];
    if (self) {
        [suffixes enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
            UIControlState state = [key integerValue];
            UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%@%@", imageNamed, obj]];
            [self setImage:image forState:state];
            if(state == UIControlStateNormal) self.frame = CGRectMakeWithOriginAndSize(CGPointMake(0, 0), image.size);
        }];
    }
    return self;
}

@end
