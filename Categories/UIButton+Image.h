//
//  UIButton+Image.h
//  Muse
//
//  Created by Hugues Bernet Rollande on 9/20/12.
//  Copyright (c) 2012 Comcast Silicon Valley. All rights reserved.
//

/*
 Create a button with a set of image based on image prefix (imageNamed_normal for normal states, ...)
 */

#import <UIKit/UIKit.h>

#ifndef kUIControlStateNormalImageSuffix
#define kUIControlStateNormalImageSuffix @"_normal"
#endif

#ifndef kUIControlStateSelectedImageSuffix
#define kUIControlStateSelectedImageSuffix @"_selected"
#endif

#ifndef kUIControlStateDisabledImageSuffix
#define kUIControlStateDisabledImageSuffix @"_disabled"
#endif

#ifndef kUIControlStateHighlightedImageSuffix
#define kUIControlStateHighlightedImageSuffix @"_highlighted"
#endif


@interface UIButton (Image)

- (id)initWithImageNamed:(NSString *)imageNamed forStates:(UIControlState)states;
- (id)initWithImageNamed:(NSString *)imageNamed forStatesSuffix:(NSDictionary *)suffixes;

+ (UIButton *)buttonWithImageNamed:(NSString *)imageNamed hightlighedImageNamed:(NSString *)highlightedImageNamed selectedImageNamed:(NSString *)selectedImageNamed disabledImageNamed:(NSString *)disabledImageNamed size:(CGSize)size;
+ (UIButton *)buttonWithImageNamed:(NSString *)imageNamed hightlighedImageNamed:(NSString *)highlightedImageNamed;
+ (UIButton *)buttonWithImageNamed:(NSString *)imageNamed;
+ (UIButton *)buttonWithImageNamed:(NSString *)imageNamed forStates:(UIControlState)states;

@end
