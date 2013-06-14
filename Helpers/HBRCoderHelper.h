//
//  HBRCoderHelper.h
//  HBR
//
//  Created by Hugues on 12/16/12.
//  Copyright (c) 2012 HBR. All rights reserved.
//

#ifndef HBR_HBRCoderHelper_h
#define HBR_HBRCoderHelper_h



#define codeObj(val)	({[coder encodeObject :val forKey:[NSString stringWithFormat:@"%s",#val]];})
#define dcodeObj(val)	{val = [[coder decodeObjectForKey:[NSString stringWithFormat:@"%s",#val]]retain];}

#endif
