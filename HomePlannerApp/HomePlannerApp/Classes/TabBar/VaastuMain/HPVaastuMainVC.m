//
//  HPVaastuMainVC.m
//  HomePlannerApp
//
//  Created by Dhanesh Gosai on 15/03/15.
//  Copyright (c) 2015 BDPartners. All rights reserved.
//

#import "HPVaastuMainVC.h"
#import "HPVaastuCell.h"
#import "HPVaastuDetailVC.h"

@interface HPVaastuMainVC ()

@end

@implementation HPVaastuMainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableDictionary *dictMenu = [[NSMutableDictionary alloc]init];
    [dictMenu setObject:@"Colour therapy at home" forKeyedSubscript:@"menu_title"];
    [dictMenu setObject:@"Colour therapy at home.jpg" forKeyedSubscript:@"menu_image"];
    
    NSMutableDictionary *dictMenu1 = [[NSMutableDictionary alloc]init];
    [dictMenu1 setObject:@"The Midas Touch - Lakshmi and Kuber" forKeyedSubscript:@"menu_title"];
    [dictMenu1 setObject:@"The Midas Touch Lakshmi and Kuber.jpg" forKeyedSubscript:@"menu_image"];
    
    NSMutableDictionary *dictMenu2 = [[NSMutableDictionary alloc]init];
    [dictMenu2 setObject:@"Vaastu principles for a well" forKeyedSubscript:@"menu_title"];
    [dictMenu2 setObject:@"Vaastu principles for a well.jpg" forKeyedSubscript:@"menu_image"];
    
    NSMutableDictionary *dictMenu3 = [[NSMutableDictionary alloc]init];
    [dictMenu3 setObject:@"Vaastu principles governing a site" forKeyedSubscript:@"menu_title"];
    [dictMenu3 setObject:@"Vaastu principles governing a site.jpg" forKeyedSubscript:@"menu_image"];
    
    NSMutableDictionary *dictMenu4 = [[NSMutableDictionary alloc]init];
    [dictMenu4 setObject:@"Colour therapy in your home" forKeyedSubscript:@"menu_title"];
    [dictMenu4 setObject:@"Colour therapy in your home.jpg" forKeyedSubscript:@"menu_image"];
    
    NSMutableDictionary *dictMenu5 = [[NSMutableDictionary alloc]init];
    [dictMenu5 setObject:@"Vastu tips for the interiors" forKeyedSubscript:@"menu_title"];
    [dictMenu5 setObject:@"Vastu tips for the interiors.jpg" forKeyedSubscript:@"menu_image"];
    
    mutArrVaastuMenu = [[NSMutableArray alloc]initWithObjects:dictMenu,dictMenu1,dictMenu2,dictMenu3,dictMenu4,dictMenu5, nil];

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
    return mutArrVaastuMenu.count;
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
    HPVaastuCell *aHPVaastuCell= (HPVaastuCell*)[tableView dequeueReusableCellWithIdentifier:@"vaastuCell"];
    
    if (aHPVaastuCell) {
        aHPVaastuCell.lblTitle.text = [[mutArrVaastuMenu objectAtIndex:indexPath.row]objectForKey:@"menu_title"];
        aHPVaastuCell.imgVaastu.layer.cornerRadius = aHPVaastuCell.imgVaastu.frame.size.width/2;
        aHPVaastuCell.imgVaastu.layer.masksToBounds=YES;
        aHPVaastuCell.imgVaastu.image = [UIImage imageNamed:[[mutArrVaastuMenu objectAtIndex:indexPath.row]objectForKey:@"menu_image"]];
    }
    aHPVaastuCell.selectionStyle = UITableViewCellSelectionStyleNone;
    return aHPVaastuCell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    HPVaastuDetailVC *objHPVaastuDetailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"HPVaastuDetailVC"];
    objHPVaastuDetailVC.dictDetailData = [mutArrVaastuMenu objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:objHPVaastuDetailVC animated:YES];
}

@end
