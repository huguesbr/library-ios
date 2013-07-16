//
//  CLLocationManager+Block.h
//  yerdle2
//
//  Created by Hugues Bernet-Rollande on 7/9/13.
//  Copyright (c) 2013 Yerdle. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>
#import <objc/runtime.h>

@interface CLLocationManagerBlocks : NSObject <CLLocationManagerDelegate>
{
	BOOL showHeadingCalibration_;
	void (^updateBlock_)(CLLocationManager *manager, CLLocation *newLocation, CLLocation *oldLocation, BOOL *stop);
	void (^errorBlock_)(NSError *error);
}

- (id)initWithUpdateBlock:(void (^)(CLLocationManager *manager, CLLocation *newLocation, CLLocation *oldLocation, BOOL *stop))updateBlock errorBlock:(void (^)(NSError *error))errorBlock;

@end

@interface CLLocationManager (Block)

@property (nonatomic, retain) id delegate_;

- (id)initWithUpdateBlock:(void (^)(CLLocationManager *manager, CLLocation *newLocation, CLLocation *oldLocation, BOOL *stop))updateBlock errorBlock:(void (^)(NSError *error))errorBlock;

@end
