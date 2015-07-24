//
//  HPProjectSearrchMainVC.m
//  HomePlannerApp
//
//  Created by Dhanesh Gosai on 15/03/15.
//  Copyright (c) 2015 BDPartners. All rights reserved.
//

#import "HPProjectSearrchMainVC.h"
#import "HPProjectCell.h"
#import "HPProjectDetailVC.h"
#import <Parse/Parse.h>

@interface HPProjectSearrchMainVC ()

@end

@implementation HPProjectSearrchMainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    hudProgress = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
    hudProgress.labelText = @"Loading Project Data";
    [self.navigationController.view addSubview:hudProgress];
    [hudProgress show:YES];
    PFQuery *query = [PFQuery queryWithClassName:@"Project_Master"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        
        
        if (!error) {
            mutArrProjectList = [[NSMutableArray alloc]initWithArray:objects];
            [self.tblProjectList reloadData];
        }
        [hudProgress hide:YES];
        [hudProgress removeFromSuperview];
    }];
    
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
    return mutArrProjectList.count;
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
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HPProjectCell *aHPProjectCell= (HPProjectCell*)[tableView dequeueReusableCellWithIdentifier:@"projectCell"];
    
    if (aHPProjectCell) {
        aHPProjectCell.lblName.text = [[mutArrProjectList  objectAtIndex:indexPath.row]objectForKey:@"P_Name"];
        PFFile *file = [[mutArrProjectList objectAtIndex:indexPath.row] objectForKey:@"P_Main_Photo"];
        [file getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
            aHPProjectCell.imgProject.image = [UIImage imageWithData:data];
        }];
        aHPProjectCell.imgTitleBack.layer.cornerRadius = 11.0;
        aHPProjectCell.imgTitleBack.layer.masksToBounds = YES;
    }
    
    return aHPProjectCell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    HPProjectDetailVC *objHPProjectDetailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"HPProjectDetailVC"];
    objHPProjectDetailVC.selectedProject = [mutArrProjectList objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:objHPProjectDetailVC animated:YES];
}

@end
