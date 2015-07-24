//
//  HPProjectDetailVC.m
//  HomePlannerApp
//
//  Created by Dhanesh Gosai on 22/07/15.
//  Copyright (c) 2015 BDPartners. All rights reserved.
//

#import "HPProjectDetailVC.h"
#import "HPGalleryViewController.h"

@interface HPProjectDetailVC ()

@end

@implementation HPProjectDetailVC
@synthesize selectedProject;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = [selectedProject objectForKey:@"P_Name"];
    self.lblTitle.text = [selectedProject objectForKey:@"P_Name"];
    self.txtPropDesc.text = [selectedProject objectForKey:@"P_Desc"];
    MKPointAnnotation *myAnnotation = [[MKPointAnnotation alloc]init];
    CLLocationCoordinate2D pinCoordinate;
    PFGeoPoint *geoPinPoint = [selectedProject objectForKey:@"P_Location"];
    pinCoordinate.latitude = geoPinPoint.latitude;
    pinCoordinate.longitude = geoPinPoint.longitude;
    myAnnotation.coordinate = pinCoordinate;
    myAnnotation.title = [selectedProject objectForKey:@"P_Name"];
    myAnnotation.subtitle = [selectedProject objectForKey:@"P_Desc"];
    [self.mapView addAnnotation:myAnnotation];
    [self.mapView setRegion:MKCoordinateRegionMake(myAnnotation.coordinate, MKCoordinateSpanMake(0.05, 0.05)) animated:YES];
    //get Full Image
    PFFile *file = [selectedProject objectForKey:@"P_Main_Photo"];
    [file getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
        self.imgFullHome.image = [UIImage imageWithData:data];
        [self.actImsgeLoad stopAnimating];
    }];
    self.scrView.contentSize = CGSizeMake(self.scrView.frame.size.width, 800);
    self.lblTitle.layer.cornerRadius = 5.0;
    self.lblTitle.layer.masksToBounds =YES;
    self.btnGetAgentDetail.layer.cornerRadius = 5.0;
    self.btnGetAgentDetail.layer.masksToBounds =YES;
    self.btnGetDirections.layer.cornerRadius = 5.0;
    self.btnGetDirections.layer.masksToBounds =YES;
    self.btnGetOwnerDetail.layer.cornerRadius = 5.0;
    self.btnGetOwnerDetail.layer.masksToBounds =YES;
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

- (IBAction)btnGetDirectionsClick:(id)sender{
    
}
- (IBAction)btnGetQwnerDetailClick:(id)sender{
    hudProgress = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
    hudProgress.labelText = @"Getting Owner Detail.";
    [self.navigationController.view addSubview:hudProgress];
    [hudProgress show:YES];
    PFQuery *query = [PFQuery queryWithClassName:@"Owner_Master"];
    [query whereKey:@"H_ID" equalTo:[self.selectedProject objectForKey:@"P_ID"]];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            if (objects.count>0) {
                if (objHPPopUpDetailVC) {
                    objHPPopUpDetailVC = nil;
                }
                objHPPopUpDetailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"HPPopUpDetailVC"];
                
                //                [objHPPopUpDetailVC.btnClose addTarget:self action:@selector(btnCloseDetailClick:) forControlEvents:UIControlEventTouchUpInside];
                
                [[[objects firstObject] objectForKey:@"O_Image"] getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
                    objHPPopUpDetailVC.imgUser.image = [UIImage imageWithData:data];
                    objHPPopUpDetailVC.lblName.text = [[objects firstObject] objectForKey:@"O_Name"];
                    objHPPopUpDetailVC.lblArea.text = [[objects firstObject] objectForKey:@"O_Address"];
                    __weak __typeof__(HPPopUpDetailVC) *weakPopUP = objHPPopUpDetailVC;
                    __weak __typeof__(self) weakSelf = self;
                    [objHPPopUpDetailVC setBtnClocseBlockClick:^(UIButton *aCloseBtn){
                        [weakPopUP.view removeFromSuperview];
                    }];
                    
                    [objHPPopUpDetailVC setBtnSmsBlockClick:^(UIButton *aCloseBtn){
                        MFMessageComposeViewController *controller = [[MFMessageComposeViewController alloc] init] ;
                        if([MFMessageComposeViewController canSendText])
                        {
                            controller.body = @"SMS message here";
                            controller.recipients = [NSArray arrayWithObjects:[[objects firstObject] objectForKey:@"O_Contact_no"], nil];
                            controller.messageComposeDelegate = weakSelf;
                            [weakSelf presentViewController:controller animated:YES completion:^{
                                
                            }];
                        }
                    }];
                    
                    [objHPPopUpDetailVC setBtnCallBlockClick:^(UIButton *aCloseBtn){
                        NSURL *telURL = [NSURL URLWithString:[NSString stringWithFormat:@"tel:%@", [[objects firstObject] objectForKey:@"O_Contact_no"]]];
                        if ([[UIApplication sharedApplication] canOpenURL: telURL]) {
                            [[UIApplication sharedApplication] openURL:telURL];
                        }else{
                            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Home Planner" message:@"Your device can not have Phone Call feature!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                            [alert show];
                        }
                        
                    }];
                    
                    [objHPPopUpDetailVC setBtnWhatsappBlockClick:^(UIButton *aCloseBtn){
                        NSURL *whatsappURL = [NSURL URLWithString:@"whatsapp://send?text=Hello Agent!"];
                        if ([[UIApplication sharedApplication] canOpenURL: whatsappURL]) {
                            [[UIApplication sharedApplication] openURL: whatsappURL];
                        }else{
                            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Home Planner" message:@"Whatsapp app is not installed on your device." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                            [alert show];
                        }
                    }];
                }];
                [appDelegate.window addSubview:objHPPopUpDetailVC.view];
            }
        }
        [hudProgress hide:YES];
        [hudProgress removeFromSuperview];
    }];
}

- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result{
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (IBAction)btnViewGalleryClick:(UIButton *)sender {
    HPGalleryViewController *objHPGalleryViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"HPGalleryViewController"];
    objHPGalleryViewController.selectedHome = selectedProject;
    objHPGalleryViewController.strNavigateFrom = @"ProjectDetail";
    [self.navigationController pushViewController:objHPGalleryViewController animated:YES];
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
            pinView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"CustomPinAnnotationView"];
            //pinView.animatesDrop = YES;
            pinView.canShowCallout = YES;
            pinView.image = [UIImage imageNamed:@"home_pin.png"];
            pinView.calloutOffset = CGPointMake(0, 0);
            //            // Add a detail disclosure button to the callout.
            //            UIButton* rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            //            [rightButton addTarget:self action:@selector(btnInfoClick:) forControlEvents:UIControlEventTouchUpInside];
            //            pinView.rightCalloutAccessoryView = rightButton;
            
            // Add an image to the left callout.
            UIImageView *iconView = [[UIImageView alloc] init];
            iconView.frame = CGRectMake(5, 0, 50, 50);
            pinView.leftCalloutAccessoryView = iconView;
            
            PFFile *file = [selectedProject objectForKey:@"P_Main_Photo"];
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


@end
