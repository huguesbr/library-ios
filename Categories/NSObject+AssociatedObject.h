//
//  NSObject+Associate.h
//  Muse
//
//  Created by Hugues on 8/10/12.
//  Copyright (c) 2012 Comcast Silicon Valley. All rights reserved.
//

/**
 Convienent methods to add variable to an object instance on the fly (Associtive object)
 */

#import <Foundation/Foundation.h>

@interface NSObject (AssociatedObject)

- (void)setAssociatedObject:(id)object forKey:(const void *)key;
- (id)associatedObjectforKey:(const void *)key;
- (void)removeAssociatedObjectForKey:(const void *)key;
- (void)removeAssociatedObjects;

@end
