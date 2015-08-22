//
//  HPSettingsVC.m
//  HomePlannerApp
//
//  Created by Dhanesh Gosai on 22/03/15.
//  Copyright (c) 2015 BDPartners. All rights reserved.
//

#import "HPSettingsVC.h"
#import "HPSettingCell.h"
#import <Parse/Parse.h>

@interface HPSettingsVC ()

@end

@implementation HPSettingsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
//    NSMutableDictionary *dictMenu = [[NSMutableDictionary alloc]init];
//    [dictMenu setObject:@"Notification" forKeyedSubscript:@"menu_title"];
//    [dictMenu setObject:@"You can 'on' & 'off' notification for new updates & new property." forKeyedSubscript:@"menu_sub_title"];
    
    NSMutableDictionary *dictMenu = [[NSMutableDictionary alloc]init];
    [dictMenu setObject:@"My Profile" forKeyedSubscript:@"menu_title"];
    [dictMenu setObject:@"To view your profile & Update your profile details." forKeyedSubscript:@"menu_sub_title"];
    
    NSMutableDictionary *dictMenu1 = [[NSMutableDictionary alloc]init];
    [dictMenu1 setObject:@"Help ?" forKeyedSubscript:@"menu_title"];
    [dictMenu1 setObject:@"regarding application flow & use to detail can get from this section." forKeyedSubscript:@"menu_sub_title"];
    
    NSMutableDictionary *dictMenu2 = [[NSMutableDictionary alloc]init];
    [dictMenu2 setObject:@"FAQ" forKeyedSubscript:@"menu_title"];
    [dictMenu2 setObject:@"regarding frequently asked questions & answar this section will help you." forKeyedSubscript:@"menu_sub_title"];
    
//    NSMutableDictionary *dictMenu3 = [[NSMutableDictionary alloc]init];
//    [dictMenu3 setObject:@"My Location" forKeyedSubscript:@"menu_title"];
//    [dictMenu3 setObject:@"For getting near by property & other location based services can get by share your location with us." forKeyedSubscript:@"menu_sub_title"];
    
    NSMutableDictionary *dictMenu4 = [[NSMutableDictionary alloc]init];
    [dictMenu4 setObject:@"Contact Us" forKeyedSubscript:@"menu_title"];
    [dictMenu4 setObject:@"You can reach us & get detail in this section." forKeyedSubscript:@"menu_sub_title"];
    
    NSMutableDictionary *dictMenu5 = [[NSMutableDictionary alloc]init];
    [dictMenu5 setObject:@"About Us" forKeyedSubscript:@"menu_title"];
    [dictMenu5 setObject:@"About Us provide full detail of application & related versions." forKeyedSubscript:@"menu_sub_title"];
    
    mutArrSettingMenu = [[NSMutableArray alloc]initWithObjects:dictMenu,dictMenu1,dictMenu2,dictMenu4,dictMenu5, nil];
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma UITableViewDataSource Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return mutArrSettingMenu.count;
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
    HPSettingCell *aSettingsCell= (HPSettingCell*)[tableView dequeueReusableCellWithIdentifier:@"settingsCell"];
    
    if (aSettingsCell) {
        switch (indexPath.row) {
            case 0:
                aSettingsCell.switchSetting.hidden=YES;
                aSettingsCell.imgArrow.hidden=NO;
                break;
            case 1:
                aSettingsCell.switchSetting.hidden=YES;
                aSettingsCell.imgArrow.hidden=NO;
                break;
            case 2:
                aSettingsCell.switchSetting.hidden=YES;
                aSettingsCell.imgArrow.hidden=NO;
                break;
            case 3:
                aSettingsCell.switchSetting.hidden=YES;
                aSettingsCell.imgArrow.hidden=NO;
                break;
            case 4:
                aSettingsCell.switchSetting.hidden=YES;
                aSettingsCell.imgArrow.hidden=NO;
                break;
            case 5:
                aSettingsCell.switchSetting.hidden=YES;
                aSettingsCell.imgArrow.hidden=NO;
                break;
            default:
                break;
        }
        
        aSettingsCell.lblTitle.text = [[mutArrSettingMenu objectAtIndex:indexPath.row]objectForKey:@"menu_title"];
        aSettingsCell.lblSubTitle.text = [[mutArrSettingMenu objectAtIndex:indexPath.row]objectForKey:@"menu_sub_title"];
    }
    aSettingsCell.selectionStyle = UITableViewCellSelectionStyleNone;
    return aSettingsCell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.row) {
        case 0:{
            if ([PFUser currentUser]) {
                [self performSegueWithIdentifier:@"MyProfileSegue" sender:nil];
            }else{
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Home Planner" message:@"Oops! to view & edit your profile please signin." delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"SignIn", nil];
                alert.tag = 105;
                [alert show];
            }
            
             break;
        }
        case 1:
            [self performSegueWithIdentifier:@"HelpSegue" sender:nil];
            break;
        case 2:
            [self performSegueWithIdentifier:@"FAQSegue" sender:nil];
            break;
        case 3:{
            HPContactusVC *objHPContactusVC= [self.storyboard instantiateViewControllerWithIdentifier:@"HPContactusVC"];
            [self.navigationController pushViewController:objHPContactusVC animated:YES];
            break;
        }
        case 4:{
            HPAboutusVC *objHPAboutusVC= [self.storyboard instantiateViewControllerWithIdentifier:@"HPAboutusVC"];
            [self.navigationController pushViewController:objHPAboutusVC animated:YES];
            break;
        }
        default:
            break;
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(alertView.tag==105){
        if (buttonIndex==1) {
             [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:1] animated:YES];
        }
    }
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)btnLogoutClick:(id)sender {
    
    [PFUser logOut];
    [self.navigationController popToViewController:[[self.navigationController viewControllers] objectAtIndex:self.navigationController.viewControllers.count-3] animated:YES];
}
@end
