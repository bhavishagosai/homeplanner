//
//  HPPostReqMainVC.m
//  HomePlannerApp
//
//  Created by Dhanesh Gosai on 15/03/15.
//  Copyright (c) 2015 BDPartners. All rights reserved.
//

#import "HPPostReqMainVC.h"

@interface HPPostReqMainVC ()

@end

@implementation HPPostReqMainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.btnSignIn.layer.cornerRadius = 5;
    self.btnSignIn.layer.masksToBounds=YES;
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
    
    if ([PFUser currentUser]) {
        hudProgress = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
        hudProgress.labelText = @"Loading Requiremnts List...";
        [self.navigationController.view addSubview:hudProgress];
        [hudProgress show:YES];
        mutArrPropertyReq = [[NSMutableArray alloc]init];
        PFQuery *query = [PFQuery queryWithClassName:@"Property_req"];
        [query whereKey:@"reqUser" containedIn:[NSArray arrayWithObject:[PFUser currentUser]]];
        [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
            if (!error) {
                mutArrPropertyReq = [[NSMutableArray alloc]initWithArray:objects];
                [self.tblReqList reloadData];
            }
            [hudProgress hide:YES];
            [hudProgress removeFromSuperview];
        }];
    }else{
        self.btnSignIn.hidden = self.lblInstruction.hidden = NO;
        self.tblReqList.hidden = YES;
        self.btnAddNewPost.hidden = YES;
    }
    
    
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return mutArrPropertyReq.count;
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
    UITableViewCell *aHPReqCell= [tableView dequeueReusableCellWithIdentifier:@"reqCell"];
    UILabel *lblTitle = (UILabel*)[aHPReqCell.contentView viewWithTag:1];
    lblTitle.text = [NSString stringWithFormat:@"Need Property for %@.",mutArrPropertyReq[indexPath.row][@"Post_Type"]];
    if([mutArrPropertyReq[indexPath.row][@"Post_Type"] isEqualToString:@"Buy"]){
        lblTitle.textColor = [UIColor yellowColor];
    }else{
        lblTitle.textColor = [UIColor whiteColor];
    }
    
    UILabel *lblCity = (UILabel*)[aHPReqCell.contentView viewWithTag:3];
    lblCity.text = mutArrPropertyReq[indexPath.row][@"Req_City"];
    
    UILabel *lblSize = (UILabel*)[aHPReqCell.contentView viewWithTag:5];
    lblSize.text = [NSString stringWithFormat:@"%@sqft.",mutArrPropertyReq[indexPath.row][@"Req_Size"]];
    
    UILabel *lblBed = (UILabel*)[aHPReqCell.contentView viewWithTag:6];
    lblBed.text = [NSString stringWithFormat:@"%@\nBHK",mutArrPropertyReq[indexPath.row][@"Req_Bed"]];
    aHPReqCell.selectionStyle = UITableViewCellSelectionStyleNone;
    return aHPReqCell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%@",indexPath);
    selectedIndex = indexPath;
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Home Planner" message:@"Are you sure you want to delete this requirement ?" delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes",nil];
    [alert show];
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 1) {
        hudProgress = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
        hudProgress.labelText = @"Deleting...";
        [self.navigationController.view addSubview:hudProgress];
        [hudProgress show:YES];

        PFObject *objDelete = [mutArrPropertyReq objectAtIndex:selectedIndex.row];
        [objDelete deleteInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (!error) {
                [mutArrPropertyReq removeObjectAtIndex:selectedIndex.row];
                [self.tblReqList deleteRowsAtIndexPaths:[NSArray arrayWithObject:selectedIndex] withRowAnimation:UITableViewRowAnimationLeft];
                
                UIImageView *imageView;
                UIImage *image = [UIImage imageNamed:@"37x-Checkmark.png"];
                imageView = [[UIImageView alloc] initWithImage:image];
                hudProgress.customView = imageView;
                hudProgress.mode = MBProgressHUDModeCustomView;
                hudProgress.labelText = @"Deleted.";
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [hudProgress hide:YES];
                    [hudProgress removeFromSuperview];
                });
            }else{
                [hudProgress hide:YES];
                [hudProgress removeFromSuperview];
            }
            
        }];
    }
}

- (IBAction)btnSignInClick:(id)sender {
    
    [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:1] animated:YES];
    
}
@end
