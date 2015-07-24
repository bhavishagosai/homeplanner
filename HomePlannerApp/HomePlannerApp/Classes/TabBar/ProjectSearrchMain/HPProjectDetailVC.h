//
//  HPProjectDetailVC.h
//  HomePlannerApp
//
//  Created by Dhanesh Gosai on 22/07/15.
//  Copyright (c) 2015 BDPartners. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HPPopUpDetailVC.h"
#import <MessageUI/MessageUI.h>

@interface HPProjectDetailVC : UIViewController<MFMessageComposeViewControllerDelegate>{
    MBProgressHUD *hudProgress;
    HPPopUpDetailVC *objHPPopUpDetailVC;
}

@property (strong, nonatomic) PFObject *selectedProject;
@property (weak, nonatomic) IBOutlet UIScrollView *scrView;
@property (weak, nonatomic) IBOutlet UIImageView *imgFullHome;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *actImsgeLoad;

@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UITextView *txtPropDesc;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UIButton *btnGetDirections;
@property (weak, nonatomic) IBOutlet UIButton *btnGetOwnerDetail;
@property (weak, nonatomic) IBOutlet UIButton *btnGetAgentDetail;

- (IBAction)btnGetDirectionsClick:(id)sender;
- (IBAction)btnGetQwnerDetailClick:(id)sender;
@end
