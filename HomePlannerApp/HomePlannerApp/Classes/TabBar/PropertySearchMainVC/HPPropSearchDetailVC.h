//
//  HPPropSearchDetailVC.h
//  HomePlannerApp
//
//  Created by Dhanesh Gosai on 19/03/15.
//  Copyright (c) 2015 BDPartners. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface HPPropSearchDetailVC : UIViewController <UIScrollViewDelegate,MKMapViewDelegate>{
    MBProgressHUD *hudProgress;
}
@property (strong, nonatomic) PFObject *selectedHome;
@property (weak, nonatomic) IBOutlet UIScrollView *scrView;
@property (weak, nonatomic) IBOutlet UIImageView *imgFullHome;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *actImsgeLoad;

@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblBHK;
@property (weak, nonatomic) IBOutlet UILabel *lblSqrf;
@property (weak, nonatomic) IBOutlet UILabel *lblFurnished;
@property (weak, nonatomic) IBOutlet UILabel *lblPropertyType;
@property (weak, nonatomic) IBOutlet UILabel *lblPossession;
@property (weak, nonatomic) IBOutlet UILabel *lblBalconies;
@property (weak, nonatomic) IBOutlet UITextView *txtPropDesc;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UIButton *btnGetDirections;
@property (weak, nonatomic) IBOutlet UIButton *btnGetOwnerDetail;
@property (weak, nonatomic) IBOutlet UIButton *btnGetAgentDetail;
- (IBAction)btnGetDirectionsClick:(id)sender;
- (IBAction)btnGetQwnerDetailClick:(id)sender;
- (IBAction)btnGetAgentDetailClick:(id)sender;
- (IBAction)btnViewGalleryClick:(UIButton *)sender;

@end
