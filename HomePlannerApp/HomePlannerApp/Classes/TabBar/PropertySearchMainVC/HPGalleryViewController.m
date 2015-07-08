//
//  HPGalleryViewController.m
//  HomePlannerApp
//
//  Created by Dhanesh Gosai on 20/06/15.
//  Copyright (c) 2015 BDPartners. All rights reserved.
//

#import "HPGalleryViewController.h"

@interface HPGalleryViewController ()

@end

@implementation HPGalleryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    mutArrPropertyImage = [[NSMutableArray alloc]init];

    hudProgress = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
    hudProgress.labelText = @"Gallery Images Loading.";
    [self.navigationController.view addSubview:hudProgress];
    [hudProgress show:YES];


    PFQuery *query = [PFQuery queryWithClassName:@"Galary_Master"];
    [query whereKey:@"H_ID" equalTo:[self.selectedHome objectForKey:@"H_ID"]];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            mutArrPropertyImage = [[NSMutableArray alloc]initWithArray:objects];
            [self.objCarosalView reloadData];
        }
        [hudProgress hide:YES];
        [hudProgress removeFromSuperview];
    }];
    self.objCarosalView.type = iCarouselTypeInvertedWheel;
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

#pragma mark iCarosal

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
