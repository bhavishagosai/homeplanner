//
//  HPPropertySearchMainVC.m
//  HomePlannerApp
//
//  Created by Dhanesh Gosai on 15/03/15.
//  Copyright (c) 2015 BDPartners. All rights reserved.
//

#import "HPPropertySearchMainVC.h"
#import "HPPropSearchDetailVC.h"
#import <Parse/Parse.h>

@interface HPPropertySearchMainVC ()

@end

@implementation HPPropertySearchMainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self segmentFilterValueChanged:self.segFilter];
    
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

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if ([tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [tableView setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [tableView setLayoutMargins:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return mutArrProperty.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HPPropertySearchCell *aPropertyCell= (HPPropertySearchCell*)[tableView dequeueReusableCellWithIdentifier:@"propertyCell"];
    
    if (aPropertyCell) {
        if ([[mutArrProperty objectAtIndex:indexPath.row] isKindOfClass:[NSDictionary class]]) {
            aPropertyCell.imgProperty.image    = [UIImage imageNamed:[[mutArrProperty objectAtIndex:indexPath.row] objectForKey:@"home_image"]];
            aPropertyCell.lblPropertyName.text = [[mutArrProperty objectAtIndex:indexPath.row] objectForKey:@"home_title"];
            aPropertyCell.lblPropLocality.text = [[mutArrProperty objectAtIndex:indexPath.row] objectForKey:@"home_locality"];
            aPropertyCell.lblSize.text         = [[mutArrProperty objectAtIndex:indexPath.row] objectForKey:@"home_size"];
            aPropertyCell.lblStatus.text       = [[mutArrProperty objectAtIndex:indexPath.row] objectForKey:@"home_status"];
            if ([[[mutArrProperty objectAtIndex:indexPath.row] objectForKey:@"H_Fav"] boolValue]) {
                aPropertyCell.btnFavourite.selected=YES;
            }else{
                aPropertyCell.btnFavourite.selected=NO;
            }
            
            [aPropertyCell.btnFavourite addTarget:self action:@selector(btnFavouriteClick:) forControlEvents:UIControlEventTouchUpInside];
            [aPropertyCell.btnFavourite setTag:indexPath.row];
        }
        else{
             aPropertyCell.lblPropertyName.text = [[mutArrProperty objectAtIndex:indexPath.row] objectForKey:@"H_Name"];
            PFFile *file = [[mutArrProperty objectAtIndex:indexPath.row] objectForKey:@"H_ThumbImage"];
            [file getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
                aPropertyCell.imgProperty.image = [UIImage imageWithData:data];
            }];
             aPropertyCell.lblPropLocality.text = [[mutArrProperty objectAtIndex:indexPath.row] objectForKey:@"H_City"];
            if ([[mutArrProperty objectAtIndex:indexPath.row] objectForKey:@"H_IsRent"]) {
                aPropertyCell.lblStatus.text = @"Ready For Rent";
            }
            if ([[mutArrProperty objectAtIndex:indexPath.row] objectForKey:@"H_IsSale"]) {
                aPropertyCell.lblStatus.text = @"Ready For Sale";
            }
            
            if ([[[mutArrProperty objectAtIndex:indexPath.row] objectForKey:@"H_Fav"] boolValue]) {
                aPropertyCell.btnFavourite.selected=YES;
            }else{
                aPropertyCell.btnFavourite.selected=NO;
            }
            
            [aPropertyCell.btnFavourite addTarget:self action:@selector(btnFavouriteClick:) forControlEvents:UIControlEventTouchUpInside];
            [aPropertyCell.btnFavourite setTag:indexPath.row];
            
            aPropertyCell.lblSize.text         = @"3 BHK.";
        }
    }
    return aPropertyCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    HPPropSearchDetailVC *objHPPropSearchDetailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"HPPropSearchDetailVC"];
    objHPPropSearchDetailVC.selectedHome = [mutArrProperty objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:objHPPropSearchDetailVC animated:YES];
}

#pragma mark Button Actions

-(IBAction)btnFavouriteClick:(UIButton*)sender{
    hudProgress = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
    
    if (sender.selected) {
        hudProgress.labelText = @"Unfavoriting...";
        [self.navigationController.view addSubview:hudProgress];
        [hudProgress show:YES];
        [[mutArrProperty objectAtIndex:sender.tag] setObject:@"NO" forKey:@"H_Fav"];
        sender.selected=NO;
        PFQuery *query = [PFQuery queryWithClassName:@"Home_Master"];
        [query whereKey:@"H_ID" equalTo:[[mutArrProperty objectAtIndex:sender.tag]  objectForKey:@"H_ID"]];
        [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
            if (!error) {
                // The find succeeded.
                NSLog(@"Successfully retrieved %d scores.", objects.count);
                if ([objects count] > 0) {
                    // student already has data saved...
                    PFObject *firstObj = [objects firstObject];
                    [firstObj setObject:[NSNumber numberWithBool:NO] forKey:@"H_Fav"];
                    [firstObj saveInBackground];
                }
                UIImageView *imageView;
                UIImage *image = [UIImage imageNamed:@"37x-Checkmark.png"];
                imageView = [[UIImageView alloc] initWithImage:image];
                hudProgress.customView = imageView;
                hudProgress.mode = MBProgressHUDModeCustomView;
                hudProgress.labelText = @"Unfavorited.";
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [hudProgress hide:YES];
                    [hudProgress removeFromSuperview];
                });
            } else {
                // Log details of the failure
                NSLog(@"Error: %@ %@", error, [error userInfo]);
            }
        }];
    }else{
        hudProgress.labelText = @"Favoriting...";
        [self.navigationController.view addSubview:hudProgress];
        [hudProgress show:YES];
        [[mutArrProperty objectAtIndex:sender.tag] setObject:@"YES" forKey:@"H_Fav"];
        sender.selected=YES;
        PFQuery *query = [PFQuery queryWithClassName:@"Home_Master"];
        [query whereKey:@"H_ID" equalTo:[[mutArrProperty objectAtIndex:sender.tag]  objectForKey:@"H_ID"]];
        [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
            if (!error) {
                // The find succeeded.
                NSLog(@"Successfully retrieved %d scores.", objects.count);
                if ([objects count] > 0) {
                    // student already has data saved...
                    PFObject *firstObj = [objects firstObject];
                    [firstObj setObject:[NSNumber numberWithBool:YES] forKey:@"H_Fav"];
                    [firstObj saveInBackground];
                }
                
                UIImageView *imageView;
                UIImage *image = [UIImage imageNamed:@"37x-Checkmark.png"];
                imageView = [[UIImageView alloc] initWithImage:image];
                hudProgress.customView = imageView;
                hudProgress.mode = MBProgressHUDModeCustomView;
                hudProgress.labelText = @"Favorited.";
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [hudProgress hide:YES];
                    [hudProgress removeFromSuperview];
                });
                
            } else {
                // Log details of the failure
                NSLog(@"Error: %@ %@", error, [error userInfo]);
            }
        }];
    }
}
- (IBAction)segmentFilterValueChanged:(UISegmentedControl*)sender {
    [mutArrProperty removeAllObjects];
    hudProgress = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
    hudProgress.labelText = @"Loading Home Data";
    [self.navigationController.view addSubview:hudProgress];
    [hudProgress show:YES];
    if (sender.selectedSegmentIndex==0) {
        NSPredicate *pradicatre = [NSPredicate predicateWithFormat:@"H_IsRent = true"];
        PFQuery *query = [PFQuery queryWithClassName:@"Home_Master" predicate:pradicatre];
        [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
            
            
            if (!error) {
                [[RevMobAds session] showPopup];
                mutArrProperty = [[NSMutableArray alloc]initWithArray:objects];
                [self.tblPropertyList reloadData];
            }
            [hudProgress hide:YES];
            [hudProgress removeFromSuperview];
        }];
    }else if(sender.selectedSegmentIndex==1){
        NSPredicate *pradicatre = [NSPredicate predicateWithFormat:@"H_IsSale = true"];
        PFQuery *query = [PFQuery queryWithClassName:@"Home_Master" predicate:pradicatre];
        [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
            if (!error) {
                [[RevMobAds session] showPopup];
                mutArrProperty = [[NSMutableArray alloc]initWithArray:objects];
                [self.tblPropertyList reloadData];
            }
            [hudProgress removeFromSuperview];
        }];
    }else{
        PFQuery *query = [PFQuery queryWithClassName:@"Home_Master" predicate:nil];
        [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
            if (!error) {
                [[RevMobAds session] showPopup];
                mutArrProperty = [[NSMutableArray alloc]initWithArray:objects];
                [self.tblPropertyList reloadData];
            }
            [hudProgress removeFromSuperview];
        }];
    }
    
}
@end
