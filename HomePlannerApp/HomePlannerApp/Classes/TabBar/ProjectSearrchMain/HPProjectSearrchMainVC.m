//
//  HPProjectSearrchMainVC.m
//  HomePlannerApp
//
//  Created by Dhanesh Gosai on 15/03/15.
//  Copyright (c) 2015 BDPartners. All rights reserved.
//

#import "HPProjectSearrchMainVC.h"
#import "HPProjectCell.h"

@interface HPProjectSearrchMainVC ()

@end

@implementation HPProjectSearrchMainVC

- (void)viewDidLoad {
    [super viewDidLoad];
//
    
    NSMutableDictionary *dictMenu = [[NSMutableDictionary alloc]init];
    [dictMenu setObject:@"DB PRIDE" forKeyedSubscript:@"project_name"];
    [dictMenu setObject:@"sender" forKeyedSubscript:@"chat_type"];
    [dictMenu setObject:@"project1.jpg" forKeyedSubscript:@"project_image"];
    
    NSMutableDictionary *dictMenu1 = [[NSMutableDictionary alloc]init];
    [dictMenu1 setObject:@"East Crest" forKeyedSubscript:@"project_name"];
    [dictMenu1 setObject:@"sender" forKeyedSubscript:@"chat_type"];
    [dictMenu1 setObject:@"project2.jpg" forKeyedSubscript:@"project_image"];
    
    NSMutableDictionary *dictMenu2 = [[NSMutableDictionary alloc]init];
    [dictMenu2 setObject:@"DS MAX SIGMANEST PROJECT" forKeyedSubscript:@"project_name"];
    [dictMenu2 setObject:@"sender" forKeyedSubscript:@"chat_type"];
    [dictMenu2 setObject:@"project3.jpg" forKeyedSubscript:@"project_image"];
    
    NSMutableDictionary *dictMenu3 = [[NSMutableDictionary alloc]init];
    [dictMenu3 setObject:@"Amrapali La Residentia project" forKeyedSubscript:@"project_name"];
    [dictMenu3 setObject:@"sender" forKeyedSubscript:@"chat_type"];
    [dictMenu3 setObject:@"project4.jpg" forKeyedSubscript:@"project_image"];
    
    NSMutableDictionary *dictMenu4 = [[NSMutableDictionary alloc]init];
    [dictMenu4 setObject:@"Liviano by Darode Jog Properties" forKeyedSubscript:@"project_name"];
    [dictMenu4 setObject:@"sender" forKeyedSubscript:@"chat_type"];
    [dictMenu4 setObject:@"project5.jpg" forKeyedSubscript:@"project_image"];
    
    NSMutableDictionary *dictMenu5 = [[NSMutableDictionary alloc]init];
    [dictMenu5 setObject:@"DB infrastructure Pvt. Ltd." forKeyedSubscript:@"project_name"];
    [dictMenu5 setObject:@"sender" forKeyedSubscript:@"chat_type"];
    [dictMenu5 setObject:@"project6.jpg" forKeyedSubscript:@"project_image"];
    
    mutArrProjectList     = [[NSMutableArray alloc]initWithObjects:dictMenu,dictMenu1,dictMenu2,dictMenu3,dictMenu4,dictMenu5, nil];
    
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
        aHPProjectCell.lblName.text = [[mutArrProjectList  objectAtIndex:indexPath.row]objectForKey:@"project_name"];
        aHPProjectCell.imgProject.image = [UIImage imageNamed:[[mutArrProjectList objectAtIndex:indexPath.row]objectForKey:@"project_image"]];
        aHPProjectCell.imgTitleBack.layer.cornerRadius = 11.0;
        aHPProjectCell.imgTitleBack.layer.masksToBounds = YES;
    }
    
    return aHPProjectCell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

@end
