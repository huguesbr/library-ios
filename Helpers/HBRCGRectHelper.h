//
//  TFRectUtilities.h
//  Tunerfish
//
//  Created by Scott Eklund on 6/21/11.
//  Copyright 2011 Plaxo. All rights reserved.
//


#ifndef TFRectUtilities_h
#define TFRectUtilities_h

#import <UIKit/UIKit.h>

CG_INLINE CGRect
CGRectWithNewHeight( CGRect inrect, CGFloat height)
{
	CGRect rect = inrect;
	rect.size.height = height;
	return rect;
}

CG_INLINE CGRect
CGRectWithNewWidth( CGRect inrect, CGFloat width)
{
	CGRect rect = inrect;
	rect.size.width = width;
	return rect;
}

CG_INLINE CGRect
CGRectWithNewOriginX( CGRect inrect, CGFloat x)
{
	CGRect rect = inrect;
	rect.origin.x = x;
	return rect;
}

CG_INLINE CGRect
CGRectWithNewOriginY( CGRect inrect, CGFloat y)
{
	CGRect rect = inrect;
	rect.origin.y = y;
	return rect;
}

CG_INLINE CGRect
CGRectMakeWithOriginAndSize( CGPoint p, CGSize s)
{
	CGRect rect;
	rect.origin = p;
	rect.size = s;
	return rect;
}

CG_INLINE CGRect
CGRectWithOriginDelta( CGRect inrect, CGSize delta)
{
	CGRect rect = inrect;
	rect.origin.x += delta.width;
	rect.origin.y += delta.height;
	return rect;
}

#endif