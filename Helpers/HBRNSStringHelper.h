//
//  StringHelper.h
//  Prototype
//
//  Created by Hugues on 11/13/12.
//  Copyright (c) 2012 1debit. All rights reserved.
//

#ifndef Prototype_StringHelper_h
#define Prototype_StringHelper_h

#define k$(string, ...) NSLocalizedString(string, __VA_ARGS__])
#define $$ NSString stringWithFormat:
#define NSMakeStringWithFormat(format, ...) [NSString stringWithFormat:format, __VA_ARGS__]
#define kPlurialize(s, o) (o == 1 ? s : [$$ @"%@s", s])

#endif
