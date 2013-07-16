//
//  CLLocationManager+Block.m
//  yerdle2
//
//  Created by Hugues Bernet-Rollande on 7/9/13.
//  Copyright (c) 2013 Yerdle. All rights reserved.
//

#import "CLLocationManager+Block.h"

@implementation CLLocationManagerBlocks

- (id)initWithUpdateBlock:(void (^)(CLLocationManager *manager, CLLocation *newLocation, CLLocation *oldLocation, BOOL *stop))updateBlock errorBlock:(void (^)(NSError *error))errorBlock
{
	self = [super init];
	if (self) {
		updateBlock_ = [updateBlock copy];
		errorBlock_ = [errorBlock copy];
	}
    
	return self;
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
	BOOL stop = NO;
	if (updateBlock_) {
		updateBlock_(manager, newLocation, oldLocation, &stop);
	}
	if (stop) {
		[manager stopUpdatingLocation];
	}
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
	if (errorBlock_) {
		errorBlock_(error);
	}
}

- (void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading
{
    
}

- (BOOL)locationManagerShouldDisplayHeadingCalibration:(CLLocationManager *)manager
{
	return showHeadingCalibration_;
}

- (void)locationManager:(CLLocationManager *)manager didEnterRegion:(CLRegion *)region
{
    
}

- (void)locationManager:(CLLocationManager *)manager didExitRegion:(CLRegion *)region
{
    
}

- (void)locationManager:(CLLocationManager *)manager monitoringDidFailForRegion:(CLRegion *)region withError:(NSError *)error
{
    
}

- (void)locationManager:(CLLocationManager *)manager didStartMonitoringForRegion:(CLRegion *)region
{
    
}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    
}


@end

@implementation CLLocationManager (Block)

@dynamic delegate_;

- (void)setDelegate_:(id)delegate_
{
	objc_setAssociatedObject(self, @"CLLocationManagerBlocks", delegate_, OBJC_ASSOCIATION_RETAIN);
}

- (id)initWithUpdateBlock:(void (^)(CLLocationManager *manager, CLLocation *newLocation, CLLocation *oldLocation, BOOL *stop))updateBlock errorBlock:(void (^)(NSError *error))errorBlock
{
	self = [self init];
	if (self) {
		CLLocationManagerBlocks *blocksDelegate = [[CLLocationManagerBlocks alloc] initWithUpdateBlock:updateBlock errorBlock:errorBlock];
		self.delegate_ = blocksDelegate;
	}
    
	return self;
}

@end
