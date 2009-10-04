//
//  CoreLocationController.m
//  ExtendedRealityGames
//
//  Created by Daniel  Ortiz on 10/2/09.
//

#import "CoreLocationController.h"


@implementation CoreLocationController

@synthesize locationManager;
@synthesize delegate;

- (id) init {
	self = [super init];
	if(self != nil){
		self.locationManager = [[[CLLocationManager alloc] init] autorelease];
		self.locationManager.delegate = self;		/* Send location data to this controller */
	}
	return self;
}

-(void)locationManager:(CLLocationManager*)manager
   didUpdateToLocation:(CLLocation*)newLocation
		  fromLocation:(CLLocation*)oldLocation{
	[self.delegate locationUpdate:newLocation oldLocation:oldLocation];
}

- (void) locationManager:(CLLocationManager*)manager
		didFailWithError:(NSError*)error{
	[self.delegate locationError:error];
}
@end
