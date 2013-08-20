//
//  HBRDispatchHelper.h
//  yerdle2
//
//  Created by Hugues Bernet-Rollande on 6/14/13.
//  Copyright (c) 2013 Yerdle. All rights reserved.
//

//#ifndef yerdle2_HBRDispatchHelper_h
//#define yerdle2_HBRDispatchHelper_h

#define dispatch_async_main(call) dispatch_async(dispatch_get_main_queue(), ^{call})

//#endif
