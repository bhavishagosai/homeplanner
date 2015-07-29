//
//  HPDirectionVC.m
//  HomePlannerApp
//
//  Created by Dhanesh Gosai on 25/07/15.
//  Copyright (c) 2015 BDPartners. All rights reserved.
//

#import "HPDirectionVC.h"

@interface HPDirectionVC ()

@end

@implementation HPDirectionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    PFGeoPoint *pointCord;
    if([self.selectedProject objectForKey:@"P_Location"]){
        pointCord = [self.selectedProject objectForKey:@"P_Location"];
    }else{
        pointCord = [self.selectedProject objectForKey:@"H_Location"];
    }
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:pointCord.latitude longitude:pointCord.longitude zoom:5];
    _mapView.camera =  camera;
    
    self.desiredAccuracy = INTULocationAccuracyCity;
    self.timeout = 10.0;
    self.locationRequestID = NSNotFound;
    [self startSingleLocationRequest];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

/**
 Starts a new one-time request for the current location.
 */
- (void)startSingleLocationRequest
{
    __weak __typeof(self) weakSelf = self;
    INTULocationManager *locMgr = [INTULocationManager sharedInstance];
    self.locationRequestID = [locMgr requestLocationWithDesiredAccuracy:self.desiredAccuracy
                                                                timeout:self.timeout
                                                   delayUntilAuthorized:YES
                                                                  block:
                              ^(CLLocation *currentLocation, INTULocationAccuracy achievedAccuracy, INTULocationStatus status) {
                                  __typeof(weakSelf) strongSelf = weakSelf;
                                  
                                  if (status == INTULocationStatusSuccess) {
                                      // achievedAccuracy is at least the desired accuracy (potentially better)
                                      NSLog(@"%@",[NSString stringWithFormat:@"Location request successful! Current Location:\n%@", currentLocation]);
                                      
                                      PFGeoPoint *pointCord;
                                      if([self.selectedProject objectForKey:@"P_Location"]){
                                          pointCord = [self.selectedProject objectForKey:@"P_Location"];
                                      }else{
                                          pointCord = [self.selectedProject objectForKey:@"H_Location"];
                                      }
                                      
                                      GMSMarker *sourceMarker = [GMSMarker markerWithPosition:currentLocation.coordinate];
                                      sourceMarker.map = _mapView;
                                      
                                      GMSMarker *destiMarker = [GMSMarker markerWithPosition:CLLocationCoordinate2DMake(pointCord.latitude, pointCord.longitude)];
                                      destiMarker.map = _mapView;
                                      
                                      
                                      [self drawPathBetween:currentLocation.coordinate toLocation:CLLocationCoordinate2DMake(pointCord.latitude, pointCord.longitude)];
                                  }
                                  else if (status == INTULocationStatusTimedOut) {
                                      // You may wish to inspect achievedAccuracy here to see if it is acceptable, if you plan to use currentLocation
                                      NSLog(@"%@",[NSString stringWithFormat:@"Location request timed out. Current Location:\n%@", currentLocation]);
                                  }
                                  else {
                                      // An error occurred
                                      if (status == INTULocationStatusServicesNotDetermined) {
                                          NSLog(@"%@",@"Error: User has not responded to the permissions alert.");
                                      } else if (status == INTULocationStatusServicesDenied) {
                                          NSLog(@"%@",@"Error: User has denied this app permissions to access device location.");
                                      } else if (status == INTULocationStatusServicesRestricted) {
                                          NSLog(@"%@",@"Error: User is restricted from using location services by a usage policy.");
                                      } else if (status == INTULocationStatusServicesDisabled) {
                                          NSLog(@"%@",@"Error: Location services are turned off for all apps on this device.");
                                      } else {
                                          NSLog(@"%@",@"An unknown error occurred.\n(Are you using iOS Simulator with location set to 'None'?)");
                                      }
                                  }
                                  
                                  strongSelf.locationRequestID = NSNotFound;
                              }];
}

/**
 Implement the setter for locationRequestID in order to update the UI as needed.
 */
- (void)setLocationRequestID:(INTULocationRequestID)locationRequestID
{
    _locationRequestID = locationRequestID;
}

-(void)drawPathBetween:(CLLocationCoordinate2D)fromLocation toLocation:(CLLocationCoordinate2D)toLocation{
    
    // Google direction URL
    NSString *baseUrl = [NSString stringWithFormat:@"http://maps.googleapis.com/maps/api/directions/json?origin=%f,%f&destination=%f,%f&sensor=true", fromLocation.latitude,  fromLocation.longitude, toLocation.latitude,  toLocation.longitude];
    
    NSURL *url = [NSURL URLWithString:[baseUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"Url: %@", url);
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        NSDictionary *aDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        
        NSString *aStrPoints = [[[[aDict objectForKey:@"routes"] firstObject] objectForKey:@"overview_polyline"] objectForKey:@"points"];
        
        GMSPath *path =  [GMSPath pathFromEncodedPath:aStrPoints];
        GMSPolyline *polyLine = [GMSPolyline polylineWithPath:path];
        polyLine.strokeWidth = 3.0;
        polyLine.strokeColor =  [UIColor redColor];
        polyLine.map= _mapView;
        NSLog(@"%@",aDict);
    }];
}

@end
