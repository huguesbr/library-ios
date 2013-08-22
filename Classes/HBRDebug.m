//
//  HBRDebug.m
//  yerdle
//
//  Created by Hugues Bernet-Rollande on 8/22/13.
//  Copyright (c) 2013 Yerdle. All rights reserved.
//

#import "HBRDebug.h"
#import "asl.h"

@implementation HBRDebug

+ (NSDictionary *)getAppLogCurrentSessionOnly:(BOOL)sessionOnly;
{
    //NSMutableArray *logs = [NSMutableArray array];
    NSMutableDictionary *logs = [NSMutableDictionary dictionary];
    aslmsg q, m;
    int i;
    const char *key, *val;
    NSLog(@"getting log for app: %@", [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"]);
    q = asl_new(ASL_TYPE_QUERY);
    asl_set_query(q, ASL_KEY_SENDER, [[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"] UTF8String], ASL_QUERY_OP_EQUAL);
    asl_set_query(q, ASL_KEY_LEVEL, "4", ASL_QUERY_OP_EQUAL);
    if(sessionOnly){
        int pid = [[NSProcessInfo processInfo] processIdentifier];
        NSString *pidString = [NSString stringWithFormat:@"%d", pid];
        char     *pidCString;
        pidCString = (char *) [pidString cStringUsingEncoding:[NSString defaultCStringEncoding]];
        asl_set_query(q, ASL_KEY_PID, pidCString, ASL_QUERY_OP_EQUAL);
    }
    
    NSArray *logsKeyToExport = [NSArray arrayWithObjects:@"Message", @"CFLog Local Time", nil];
    
    aslresponse r = asl_search(NULL, q);
    while (NULL != (m = aslresponse_next(r)))
    {
        NSMutableDictionary *log = [NSMutableDictionary dictionary];
        for (i = 0; (NULL != (key = asl_key(m, i))); i++)
        {
            NSString *keyString = [NSString stringWithUTF8String:(char *)key];
            if([logsKeyToExport indexOfObject:keyString] == NSNotFound) continue;
            val = asl_get(m, key);
            NSString *string = [NSString stringWithUTF8String:val];
            [log setObject:string forKey:keyString];
        }
        [logs setValue:[log valueForKey:@"Message"] forKey:[log valueForKey:@"CFLog Local Time"]];
    }
    aslresponse_free(r);
    return logs;
}
@end
