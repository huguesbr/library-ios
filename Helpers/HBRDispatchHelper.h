//
//  HBRDispatchHelper.h
//  yerdle2
//
//  Created by Hugues Bernet-Rollande on 6/14/13.
//  Copyright (c) 2013 Yerdle. All rights reserved.
//

//#ifndef yerdle2_HBRDispatchHelper_h
//#define yerdle2_HBRDispatchHelper_h

#define dispatch_async_background(...) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{ __VA_ARGS__ })
#define dispatch_async_default(...) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{ __VA_ARGS__ })
#define dispatch_async_main(...) dispatch_async(dispatch_get_main_queue(), ^{ __VA_ARGS__ })

//#endif
