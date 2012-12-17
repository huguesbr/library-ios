//
//  HBRDebut.h
//  OneDebit
//
//  Created by Hugues on 12/16/12.
//  Copyright (c) 2012 OneDebit. All rights reserved.
//

#ifndef OneDebit_HBRDebut_h
#define OneDebit_HBRDebut_h

//po [NSThread callStackSymbols]


#define NSLogCallStack NSLog(@"Stack trace: %@", [NSThread callStackSymbols]);
#define NSLogSelector NSLog(@"Current selector: %@", NSStringFromSelector(_cmd));
#define NSLogObjectClass NSLog(@"Object class: %@", NSStringFromClass([self class]));
#define NSLogFilename NSLog(@"Filename: %@", [[NSString stringWithUTF8String:__FILE__] lastPathComponent]);
#define NSLogExtra(fmt, ...) NSLog(@"%s:%d (%s): " fmt, __FILE__, __LINE__, __func__, ## __VA_ARGS__)

#endif
