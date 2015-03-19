//
//  HPPropertySearchMainVC.m
//  HomePlannerApp
//
//  Created by Dhanesh Gosai on 15/03/15.
//  Copyright (c) 2015 BDPartners. All rights reserved.
//

#import "HPPropertySearchMainVC.h"
#import "HPPropSearchDetailVC.h"

@interface HPPropertySearchMainVC ()

@end

@implementation HPPropertySearchMainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    mutArrProperty = [[NSMutableArray alloc]init];
    
    NSMutableDictionary *dictData = [[NSMutableDictionary alloc] init];
    [dictData setObject:@"My Sweet Home" forKey:@"home_title"];
    [dictData setObject:@"Bopal" forKey:@"home_locality"];
    [dictData setObject:@"3BHK" forKey:@"home_size"];
    [dictData setObject:@"Ready For Rent" forKey:@"home_status"];
    [dictData setObject:@"home1.jpg" forKey:@"home_image"];
    [dictData setObject:@"NO" forKey:@"home_favourite"];
    [mutArrProperty addObject:dictData];
    
    dictData = [[NSMutableDictionary alloc] init];
    [dictData setObject:@"Garden Face Flat" forKey:@"home_title"];
    [dictData setObject:@"South Bopal" forKey:@"home_locality"];
    [dictData setObject:@"2BHK" forKey:@"home_size"];
    [dictData setObject:@"Unfurnished Ready For Rent" forKey:@"home_status"];
    [dictData setObject:@"home2.jpg" forKey:@"home_image"];
    [dictData setObject:@"NO" forKey:@"home_favourite"];
    [mutArrProperty addObject:dictData];
    
    
    dictData = [[NSMutableDictionary alloc] init];
    [dictData setObject:@"Good Surrounding flat" forKey:@"home_title"];
    [dictData setObject:@"Main Bopal" forKey:@"home_locality"];
    [dictData setObject:@"1BHK" forKey:@"home_size"];
    [dictData setObject:@"Ready For Rent" forKey:@"home_status"];
    [dictData setObject:@"home3.jpg" forKey:@"home_image"];
    [dictData setObject:@"NO" forKey:@"home_favourite"];
    [mutArrProperty addObject:dictData];
    
    dictData = [[NSMutableDictionary alloc] init];
    [dictData setObject:@"Low budget bunglow" forKey:@"home_title"];
    [dictData setObject:@"North Bopal" forKey:@"home_locality"];
    [dictData setObject:@"3BHK Bunglow" forKey:@"home_size"];
    [dictData setObject:@"Ready For Rent" forKey:@"home_status"];
    [dictData setObject:@"home4.jpg" forKey:@"home_image"];
    [dictData setObject:@"NO" forKey:@"home_favourite"];
    [mutArrProperty addObject:dictData];
    
    dictData = [[NSMutableDictionary alloc] init];
    [dictData setObject:@"Home In Nature" forKey:@"home_title"];
    [dictData setObject:@"Ghuma" forKey:@"home_locality"];
    [dictData setObject:@"2BHK Row House" forKey:@"home_size"];
    [dictData setObject:@"Ready For Rent" forKey:@"home_status"];
    [dictData setObject:@"home5.jpg" forKey:@"home_image"];
    [dictData setObject:@"NO" forKey:@"home_favourite"];
    [mutArrProperty addObject:dictData];
    
    dictData = [[NSMutableDictionary alloc] init];
    [dictData setObject:@"Flat Near School" forKey:@"home_title"];
    [dictData setObject:@"Shilaj" forKey:@"home_locality"];
    [dictData setObject:@"2BHK" forKey:@"home_size"];
    [dictData setObject:@"Ready For Rent" forKey:@"home_status"];
    [dictData setObject:@"home6.jpg" forKey:@"home_image"];
    [dictData setObject:@"NO" forKey:@"home_favourite"];
    [mutArrProperty addObject:dictData];
    
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

#pragma UITableViewDataSource Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return mutArrProperty.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HPPropertySearchCell *aPropertyCell= (HPPropertySearchCell*)[tableView dequeueReusableCellWithIdentifier:@"propertyCell"];
    
    if (aPropertyCell) {
        aPropertyCell.imgProperty.image    = [UIImage imageNamed:[[mutArrProperty objectAtIndex:indexPath.row] objectForKey:@"home_image"]];
        aPropertyCell.lblPropertyName.text = [[mutArrProperty objectAtIndex:indexPath.row] objectForKey:@"home_title"];
        aPropertyCell.lblPropLocality.text = [[mutArrProperty objectAtIndex:indexPath.row] objectForKey:@"home_locality"];
        aPropertyCell.lblSize.text         = [[mutArrProperty objectAtIndex:indexPath.row] objectForKey:@"home_size"];
        aPropertyCell.lblStatus.text       = [[mutArrProperty objectAtIndex:indexPath.row] objectForKey:@"home_status"];
        if ([[[mutArrProperty objectAtIndex:indexPath.row] objectForKey:@"home_favourite"] boolValue]) {
            aPropertyCell.btnFavourite.selected=YES;
        }else{
            aPropertyCell.btnFavourite.selected=NO;
        }
        
        [aPropertyCell.btnFavourite addTarget:self action:@selector(btnFavouriteClick:) forControlEvents:UIControlEventTouchUpInside];
        [aPropertyCell.btnFavourite setTag:indexPath.row];
        

    }
    
    return aPropertyCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    HPPropSearchDetailVC *objHPPropSearchDetailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"HPPropSearchDetailVC"];
    [self.navigationController pushViewController:objHPPropSearchDetailVC animated:YES];
}

#pragma mark Button Actions

-(IBAction)btnFavouriteClick:(UIButton*)sender{

    if (sender.selected) {
        [[mutArrProperty objectAtIndex:sender.tag] setObject:@"NO" forKey:@"home_favourite"];
        sender.selected=NO;
    }else{
        [[mutArrProperty objectAtIndex:sender.tag] setObject:@"YES" forKey:@"home_favourite"];
        sender.selected=YES;
    }
}
- (IBAction)segmentFilterValueChanged:(id)sender {
}
@end
