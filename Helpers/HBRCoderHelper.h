//
//  HBRCoderHelper.h
//  OneDebit
//
//  Created by Hugues on 12/16/12.
//  Copyright (c) 2012 OneDebit. All rights reserved.
//

#ifndef OneDebit_HBRCoderHelper_h
#define OneDebit_HBRCoderHelper_h



#define codeObj(val)	({[coder encodeObject :val forKey:[NSString stringWithFormat:@"%s",#val]];})
#define dcodeObj(val)	{val = [[coder decodeObjectForKey:[NSString stringWithFormat:@"%s",#val]]retain];}

#endif
