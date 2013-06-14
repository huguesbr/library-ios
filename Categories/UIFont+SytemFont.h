//
//  UIFont+SytemFont.h
//  Muse
//
//  Created by Hugues Bernet Rollande on 9/20/12.
//  Copyright (c) 2012 Comcast Silicon Valley. All rights reserved.
//


/**
 Hack to override default system font (and change all systemFont or boldSystemFont to a custom font)
 */

#ifndef kUIFontSystemFontDefault
#define kUIFontSystemFontDefault @"HelveticaNeue"
#endif

#ifndef kUIFontSystemFontDefaultBold
#define kUIFontSystemFontDefaultBold @"HelveticaNeue"
#endif

#import <UIKit/UIKit.h>

@interface UIFont (SytemFont)

@end
