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

- (void)viewDidLoad {
    [super viewDidLoad];
    
    mutArrPropertyImage = [[NSMutableArray alloc]init];
    
    NSMutableDictionary *dictData = [[NSMutableDictionary alloc]init];
    [dictData setObject:@"prop1.jpg" forKey:@"property_image"];
    [dictData setObject:@"Main Hall" forKey:@"property_title"];
    [mutArrPropertyImage addObject:dictData];
    
    NSMutableDictionary *dictData1 = [[NSMutableDictionary alloc]init];
    [dictData1 setObject:@"prop2.jpg" forKey:@"property_image"];
    [dictData1 setObject:@"Main Hall" forKey:@"property_title"];
    [mutArrPropertyImage addObject:dictData1];
    
    NSMutableDictionary *dictData2 = [[NSMutableDictionary alloc]init];
    [dictData2 setObject:@"prop3.jpg" forKey:@"property_image"];
    [dictData2 setObject:@"Main Hall" forKey:@"property_title"];
    [mutArrPropertyImage addObject:dictData2];
    
    NSMutableDictionary *dictData3 = [[NSMutableDictionary alloc]init];
    [dictData3 setObject:@"prop4.jpg" forKey:@"property_image"];
    [dictData3 setObject:@"Main Hall" forKey:@"property_title"];
    [mutArrPropertyImage addObject:dictData3];
    
    NSMutableDictionary *dictData4 = [[NSMutableDictionary alloc]init];
    [dictData4 setObject:@"prop5.jpg" forKey:@"property_image"];
    [dictData4 setObject:@"Main Hall" forKey:@"property_title"];
    [mutArrPropertyImage addObject:dictData4];
    
    
    self.title = @"My Sweet Home";
    self.objCarosalView.type = iCarouselTypeInvertedWheel;
    [self.objCarosalView reloadData];
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
    imgProperty.image = [UIImage imageNamed:[[mutArrPropertyImage objectAtIndex:index] objectForKey:@"property_image"]];
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
