//
//  HPNearBySearchMainVC.m
//  HomePlannerApp
//
//  Created by Dhanesh Gosai on 15/03/15.
//  Copyright (c) 2015 BDPartners. All rights reserved.
//

#import "HPNearBySearchMainVC.h"

@interface HPNearBySearchMainVC ()

@end

@implementation HPNearBySearchMainVC

- (void)viewDidLoad {
    [super viewDidLoad];
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

- (IBAction)segMapTypeValueChanged:(UISegmentedControl*)sender {
    
    switch (sender.selectedSegmentIndex) {
        case 0:
            [self.mapViewNearBy setMapType:MKMapTypeStandard];
            break;
        case 1:
            [self.mapViewNearBy setMapType:MKMapTypeSatellite];
            break;
        case 2:
            [self.mapViewNearBy setMapType:MKMapTypeHybrid];
            break;
        default:
            break;
    }
    
    
}


/**
 Starts a new subscription for location updates.
 */
- (void)startLocationUpdateSubscription
{
    __weak __typeof(self) weakSelf = self;
    INTULocationManager *locMgr = [INTULocationManager sharedInstance];
    self.locationRequestID = [locMgr subscribeToLocationUpdatesWithBlock:^(CLLocation *currentLocation, INTULocationAccuracy achievedAccuracy, INTULocationStatus status) {
        __typeof(weakSelf) strongSelf = weakSelf;
        
        if (status == INTULocationStatusSuccess) {
            // A new updated location is available in currentLocation, and achievedAccuracy indicates how accurate this particular location is
            NSLog(@"%@",[NSString stringWithFormat:@"Subscription block called with Current Location:\n%@", currentLocation]);

        }
        else {
            // An error occurred, which causes the subscription to cancel automatically (this block will not execute again unless it is used to start a new subscription).
            strongSelf.locationRequestID = NSNotFound;
            
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
    }];
}

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
                                      //            MKMapCamera *camera =[MKMapCamera cameraLookingAtCenterCoordinate:currentLocation.coordinate fromEyeCoordinate:currentLocation.coordinate eyeAltitude:0.0];
                                      //            [self.mapViewNearBy setCamera:camera animated:YES];
                                      [self.mapViewNearBy setRegion:MKCoordinateRegionMake(currentLocation.coordinate, MKCoordinateSpanMake(0.5, 0.5)) animated:YES];
                                      [self dropPinsonMap:currentLocation];
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
    
//    BOOL isProcessingLocationRequest = (locationRequestID != NSNotFound);
//    
//    self.subscriptionSwitch.enabled = !isProcessingLocationRequest;
//    self.desiredAccuracyControl.enabled = !isProcessingLocationRequest;
//    self.timeoutSlider.enabled = !isProcessingLocationRequest;
//    self.requestCurrentLocationButton.enabled = !isProcessingLocationRequest;
//    self.forceCompleteRequestButton.enabled = isProcessingLocationRequest && !self.subscriptionSwitch.on;
//    self.cancelRequestButton.enabled = isProcessingLocationRequest;
//    
//    if (isProcessingLocationRequest) {
//        [self.activityIndicator startAnimating];
////        self.statusLabel.text = @"Location request in progress...";
//    } else {
//        [self.activityIndicator stopAnimating];
//    }
}


-(void)dropPinsonMap:(CLLocation*)currentLocation
{
    
    
//    NSMutableArray  *mutArrPins = [[NSMutableArray alloc]init];
//    
//    NSMutableDictionary *dictLocation = [[NSMutableDictionary alloc]init];
//    [dictLocation setObject:@"23.027182" forKey:@"latitude"];
//    [dictLocation setObject:@"72.508462" forKey:@"longitude"];
//    [dictLocation setObject:@"Iscon Circle" forKey:@"title"];
//    [dictLocation setObject:@"132 sqyrd Flat" forKey:@"sub_title"];
//    [mutArrPins addObject:dictLocation];
//    
//    NSMutableDictionary *dictLocation1 = [[NSMutableDictionary alloc]init];
//    [dictLocation1 setObject:@"23.993411" forKey:@"latitude"];
//    [dictLocation1 setObject:@"72.629161" forKey:@"longitude"];
//    [dictLocation1 setObject:@"Naherunagar" forKey:@"title"];
//    [dictLocation1 setObject:@"2000 sqrft Flat" forKey:@"sub_title"];
//    [mutArrPins addObject:dictLocation1];
//    
//    NSMutableDictionary *dictLocation2 = [[NSMutableDictionary alloc]init];
//    [dictLocation2 setObject:@"23.0143369" forKey:@"latitude"];
//    [dictLocation2 setObject:@"72.531327" forKey:@"longitude"];
//    [dictLocation2 setObject:@"Shivranjani Cross Road" forKey:@"title"];
//    [dictLocation2 setObject:@"150 sqyrd row house" forKey:@"sub_title"];
//    [mutArrPins addObject:dictLocation2];
//    
//    NSMutableDictionary *dictLocation3 = [[NSMutableDictionary alloc]init];
//    [dictLocation3 setObject:@"23.0206198" forKey:@"latitude"];
//    [dictLocation3 setObject:@"72.4687152" forKey:@"longitude"];
//    [dictLocation3 setObject:@"South Bopal" forKey:@"title"];
//    [dictLocation3 setObject:@"140 sqyrd Flat" forKey:@"sub_title"];
//    [mutArrPins addObject:dictLocation3];
//    
//    NSMutableDictionary *dictLocation4 = [[NSMutableDictionary alloc]init];
//    [dictLocation4 setObject:@"23.0359472" forKey:@"latitude"];
//    [dictLocation4 setObject:@"72.452845" forKey:@"longitude"];
//    [dictLocation4 setObject:@"Vibhusha Bunglow" forKey:@"title"];
//    [dictLocation4 setObject:@"250 sqyrd Bunglow" forKey:@"sub_title"];
//    [mutArrPins addObject:dictLocation4];
    
    
    PFQuery *query = [PFQuery queryWithClassName:@"Home_Master"];
    PFGeoPoint *geoPoint = [PFGeoPoint geoPointWithLocation:currentLocation];
    [query whereKey:@"H_Location" nearGeoPoint:geoPoint withinKilometers:50.0];
    
    hudProgress = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
    hudProgress.labelText = @"Loading Home Data";
    [self.navigationController.view addSubview:hudProgress];
    [hudProgress show:YES];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            mutArrPins = [[NSMutableArray alloc]initWithArray:objects];
            dispatch_async(dispatch_get_main_queue(), ^(void){
                for (int i =0; i<mutArrPins.count; i++) {
                    MKPointAnnotation *myAnnotation = [[MKPointAnnotation alloc]init];
                    CLLocationCoordinate2D pinCoordinate;
                    PFGeoPoint *geoPinPoint = [[mutArrPins objectAtIndex:i] objectForKey:@"H_Location"];
                    pinCoordinate.latitude = geoPinPoint.latitude;
                    pinCoordinate.longitude = geoPinPoint.longitude;
                    myAnnotation.coordinate = pinCoordinate;
                    myAnnotation.title = [[mutArrPins objectAtIndex:i] objectForKey:@"H_Name"];
                    myAnnotation.subtitle = [[mutArrPins objectAtIndex:i] objectForKey:@"H_Desc"];
                    objc_setAssociatedObject(myAnnotation, @"tag", [NSString stringWithFormat:@"%d",i],OBJC_ASSOCIATION_RETAIN_NONATOMIC);
                    [self.mapViewNearBy addAnnotation:myAnnotation];
                }
            });
        }
        [hudProgress hide:YES];
        [hudProgress removeFromSuperview];
    }];
    
//    for (int i =0; i<mutArrPins.count; i++) {
//        MKPointAnnotation *myAnnotation = [[MKPointAnnotation alloc]init];
//        CLLocationCoordinate2D pinCoordinate;
//        pinCoordinate.latitude = [[[mutArrPins objectAtIndex:i] objectForKey:@"latitude"] floatValue];
//        pinCoordinate.longitude = [[[mutArrPins objectAtIndex:i] objectForKey:@"longitude"] floatValue];
//        myAnnotation.coordinate = pinCoordinate;
//        myAnnotation.title = [[mutArrPins objectAtIndex:i] objectForKey:@"title"];
//        myAnnotation.subtitle = [[mutArrPins objectAtIndex:i] objectForKey:@"sub_title"];
//        [self.mapViewNearBy addAnnotation:myAnnotation];
//    }
    
}


#pragma mark MKMapView Delegate 

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
    [self.mapViewNearBy setCenterCoordinate:userLocation.coordinate animated:YES];
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    // If it's the user location, just return nil.
    if ([annotation isKindOfClass:[MKUserLocation class]])
        return nil;
    
    // Handle any custom annotations.
    if ([annotation isKindOfClass:[MKPointAnnotation class]])
    {
        // Try to dequeue an existing pin view first.
        MKAnnotationView *pinView = (MKAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:@"CustomPinAnnotationView"];
        if (!pinView)
        {
            // If an existing pin view was not available, create one.
            NSString *strTag =objc_getAssociatedObject(annotation, @"tag");
            pinView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"CustomPinAnnotationView"];
            //pinView.animatesDrop = YES;
            pinView.canShowCallout = YES;
            pinView.image = [UIImage imageNamed:@"home_pin.png"];
            pinView.calloutOffset = CGPointMake(0, 0);
            // Add a detail disclosure button to the callout.
            UIButton* rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            rightButton.tag = [strTag integerValue];
            [rightButton addTarget:self action:@selector(btnInfoClick:) forControlEvents:UIControlEventTouchUpInside];
            pinView.rightCalloutAccessoryView = rightButton;
            
            // Add an image to the left callout.
            UIImageView *iconView = [[UIImageView alloc] init];
            iconView.frame = CGRectMake(5, 0, 50, 50);
            pinView.leftCalloutAccessoryView = iconView;
//            dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
//                //Background Thread
//                dispatch_async(dispatch_get_main_queue(), ^(void){
//                    //Run UI Updates
//                });
//            });
            
            
            PFFile *file = [[mutArrPins objectAtIndex:[strTag integerValue]] objectForKey:@"H_ThumbImage"];
            [file getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
                iconView.image = [UIImage imageWithData:data];
            }];
            
            
        } else {
            pinView.annotation = annotation;
        }
        return pinView;
    }
    return nil;
}


-(IBAction)btnInfoClick:(id)sender{
    HPPropSearchDetailVC *objHPPropSearchDetailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"HPPropSearchDetailVC"];
    objHPPropSearchDetailVC.selectedHome = [mutArrPins objectAtIndex:[sender tag]];
    [self.navigationController pushViewController:objHPPropSearchDetailVC animated:YES];
}
@end
