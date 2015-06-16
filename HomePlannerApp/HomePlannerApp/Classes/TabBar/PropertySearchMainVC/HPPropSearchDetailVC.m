//
//  HPPropSearchDetailVC.m
//  HomePlannerApp
//
//  Created by Dhanesh Gosai on 19/03/15.
//  Copyright (c) 2015 BDPartners. All rights reserved.
//

#import "HPPropSearchDetailVC.h"

@interface HPPropSearchDetailVC ()

@end

@implementation HPPropSearchDetailVC
@synthesize selectedHome;
- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"Selectedc Home =m %@",selectedHome);
//    mutArrPropertyImage = [[NSMutableArray alloc]init];
//    
//    hudProgress = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
//    hudProgress.labelText = @"Loading Data";
//    [self.navigationController.view addSubview:hudProgress];
//    [hudProgress show:YES];
//    
//
//    PFQuery *query = [PFQuery queryWithClassName:@"Galary_Master"];
//    [query whereKey:@"H_ID" equalTo:@"101"];
//    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
//        if (!error) {
//            mutArrPropertyImage = [[NSMutableArray alloc]initWithArray:objects];
//            [self.objCarosalView reloadData];
//        }
//        [hudProgress hide:YES];
//        [hudProgress removeFromSuperview];
//    }];
    
    
    self.title = [selectedHome objectForKey:@"H_Name"];
    self.lblTitle.text = [selectedHome objectForKey:@"H_Name"];
    self.lblBHK.text = [selectedHome objectForKey:@"H_BHK"];
    self.lblSqrf.text = [selectedHome objectForKey:@"H_Area"];
    self.txtPropDesc.text = [selectedHome objectForKey:@"H_Desc"];
    self.lblPossession.text = [selectedHome objectForKey:@"H_Possession"];
    self.lblFurnished.text = [selectedHome objectForKey:@"H_Furnish"];
    
    
    MKPointAnnotation *myAnnotation = [[MKPointAnnotation alloc]init];
    CLLocationCoordinate2D pinCoordinate;
    PFGeoPoint *geoPinPoint = [selectedHome objectForKey:@"H_Location"];
    pinCoordinate.latitude = geoPinPoint.latitude;
    pinCoordinate.longitude = geoPinPoint.longitude;
    myAnnotation.coordinate = pinCoordinate;
    myAnnotation.title = [selectedHome objectForKey:@"H_Name"];
    myAnnotation.subtitle = [selectedHome objectForKey:@"H_Desc"];
//    objc_setAssociatedObject(myAnnotation, @"tag", [NSString stringWithFormat:@"%d",i],OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self.mapView addAnnotation:myAnnotation];
    
    self.objCarosalView.type = iCarouselTypeInvertedWheel;
    
    self.scrView.contentSize = CGSizeMake(self.scrView.frame.size.width, 1300);
    self.lblTitle.layer.cornerRadius = 5.0;
    self.lblTitle.layer.masksToBounds =YES;
    self.lblSqrf.layer.cornerRadius = 5.0;
    self.lblSqrf.layer.masksToBounds =YES;
    self.lblPropertyType.layer.cornerRadius = 10.0;
    self.lblPropertyType.layer.masksToBounds =YES;
    self.lblPossession.layer.cornerRadius = 10.0;
    self.lblPossession.layer.masksToBounds =YES;
    self.lblFurnished.layer.cornerRadius = 10.0;
    self.lblFurnished.layer.masksToBounds =YES;
    self.lblBHK.layer.cornerRadius = 5.0;
    self.lblBHK.layer.masksToBounds =YES;
    self.lblBalconies.layer.cornerRadius = 10.0;
    self.lblBalconies.layer.masksToBounds =YES;
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

- (IBAction)btnGetDirectionsClick:(id)sender {
}

- (IBAction)btnGetQwnerDetailClick:(id)sender {
}

- (IBAction)btnGetAgentDetailClick:(id)sender {
}


#pragma mark iAc

- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel{
    return mutArrPropertyImage.count;
}
- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view{
    
    UIImageView *imgProperty = [[UIImageView alloc]initWithFrame:carousel.frame];
    imgProperty.image = [UIImage imageNamed:@"photo_default.png"];
    
    [[[mutArrPropertyImage objectAtIndex:index] objectForKey:@"Image"] getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
        imgProperty.image = [UIImage imageWithData:data];
    }];
    return imgProperty;
    
}
//- (NSInteger)numberOfPlaceholdersInCarousel:(iCarousel *)carousel{
//    
//}
//- (UIView *)carousel:(iCarousel *)carousel placeholderViewAtIndex:(NSInteger)index reusingView:(UIView *)view{
//    
//}
- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index{
    
}
@end
