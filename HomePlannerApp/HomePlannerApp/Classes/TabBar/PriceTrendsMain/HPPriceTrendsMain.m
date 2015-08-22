//
//  HPPriceTrendsMain.m
//  HomePlannerApp
//
//  Created by Dhanesh Gosai on 15/03/15.
//  Copyright (c) 2015 BDPartners. All rights reserved.
//

#import "HPPriceTrendsMain.h"
#import "HPTrendsCell.h"
#import "HPPricedetailVC.h"

@interface HPPriceTrendsMain ()

@end

@implementation HPPriceTrendsMain

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSMutableDictionary *dictMenu = [[NSMutableDictionary alloc]init];
    [dictMenu setObject:@"Ahmedabad" forKeyedSubscript:@"city_name"];
    
    NSMutableDictionary *dictMenu1 = [[NSMutableDictionary alloc]init];
    [dictMenu1 setObject:@"Mumbai" forKeyedSubscript:@"city_name"];
    
    NSMutableDictionary *dictMenu2 = [[NSMutableDictionary alloc]init];
    [dictMenu2 setObject:@"Vadodra" forKeyedSubscript:@"city_name"];
    
    NSMutableDictionary *dictMenu3 = [[NSMutableDictionary alloc]init];
    [dictMenu3 setObject:@"Rajkot" forKeyedSubscript:@"city_name"];
    
    NSMutableDictionary *dictMenu4 = [[NSMutableDictionary alloc]init];
    [dictMenu4 setObject:@"Jamnagar" forKeyedSubscript:@"city_name"];
    
    NSMutableDictionary *dictMenu5 = [[NSMutableDictionary alloc]init];
    [dictMenu5 setObject:@"Bhavnagar" forKeyedSubscript:@"city_name"];

    
    mutArrTrendsList     = [[NSMutableArray alloc]initWithObjects:dictMenu,dictMenu1,dictMenu2,dictMenu3,dictMenu4,dictMenu5, nil];
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
    return mutArrTrendsList.count;
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
    HPTrendsCell *aHPTrendsCell= (HPTrendsCell*)[tableView dequeueReusableCellWithIdentifier:@"trendsCell"];
    
    if (aHPTrendsCell) {
        aHPTrendsCell.lblName.text = [[mutArrTrendsList  objectAtIndex:indexPath.row]objectForKey:@"city_name"];
    }
    aHPTrendsCell.selectionStyle = UITableViewCellSelectionStyleNone;
    return aHPTrendsCell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    HPPricedetailVC *objHPPricedetailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"HPPricedetailVC"];
    objHPPricedetailVC.dictDetail = [mutArrTrendsList objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:objHPPricedetailVC animated:YES];
}

@end
