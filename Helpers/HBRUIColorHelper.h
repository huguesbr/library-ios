//
//  ColorHelper.h
//  HBR
//
//  Created by Hugues on 12/7/12.
//  Copyright (c) 2012 HBR. All rights reserved.
//

#ifndef HBR_ColorHelper_h
#define HBR_ColorHelper_h


#define UIColorWithHexa(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define UIColorWithRGB(r, g, b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define UIColorWithRGBA(r, g, b, a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]


#endif
