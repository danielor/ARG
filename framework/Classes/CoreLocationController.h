//
//  CoreLocationController.h
//  ExtendedRealityGames
//
//  Created by Daniel  Ortiz on 10/2/09.
//


// Views should extend this protocol so that they receive location
// data(longitude, latitude, altitude, etc.) on a continuous basis.
// Therefore, as the users move around this protocol will relay to
// the view their updated location. These two function needed to be
// overwritten in a view that uses this protocol. They will be called
// when the CoreLocationController gets new location data.
@protocol LocationProviderDelegate <NSObject>
@required
- (void) locationUpdate:(CLLocation*)newLocation oldLocation:(CLLocation*)OldLocation;
- (void) locationError:(NSError*)error;
@end


@interface CoreLocationController : NSObject<CLLocationManagerDelegate> {
	CLLocationManager * locationManager;
	id delegate;
}

// Properties of the controller
@property (nonatomic, retain) CLLocationManager * locationManager;
@property (nonatomic, assign) id<LocationProviderDelegate> delegate;

// The Location Manager protocol
-(void) locationManager:(CLLocationManager*)manager
	didUpdateToLocation:(CLLocation*)newLocation
		   fromLocation:(CLLocation*)oldLocation;

-(void)locationManager:(CLLocationManager*)manager
	  didFailWithError:(NSError*)error;
@end
