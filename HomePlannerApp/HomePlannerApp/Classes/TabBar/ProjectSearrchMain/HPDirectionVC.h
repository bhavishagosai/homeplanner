//
//  HPDirectionVC.h
//  HomePlannerApp
//
//  Created by Dhanesh Gosai on 25/07/15.
//  Copyright (c) 2015 BDPartners. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "INTULocationManager.h"
#import <GoogleMaps/GoogleMaps.h>

@interface HPDirectionVC : UIViewController<GMSMapViewDelegate>
@property (weak, nonatomic) IBOutlet GMSMapView *mapView;
@property (assign, nonatomic) INTULocationAccuracy desiredAccuracy;
@property (assign, nonatomic) NSTimeInterval timeout;
@property (assign, nonatomic) INTULocationRequestID locationRequestID;
@property (strong, nonatomic) PFObject *selectedProject;
@end
