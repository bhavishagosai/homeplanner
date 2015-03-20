//
//  HPNearBySearchMainVC.h
//  HomePlannerApp
//
//  Created by Dhanesh Gosai on 15/03/15.
//  Copyright (c) 2015 BDPartners. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "INTULocationManager.h"
#import "HPPropSearchDetailVC.h"

@interface HPNearBySearchMainVC : UIViewController
@property (weak, nonatomic) IBOutlet UISearchBar *searchbar;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segMapType;
@property (weak, nonatomic) IBOutlet MKMapView *mapViewNearBy;
- (IBAction)segMapTypeValueChanged:(id)sender;
@property (assign, nonatomic) INTULocationAccuracy desiredAccuracy;
@property (assign, nonatomic) NSTimeInterval timeout;
@property (assign, nonatomic) INTULocationRequestID locationRequestID;
@end
