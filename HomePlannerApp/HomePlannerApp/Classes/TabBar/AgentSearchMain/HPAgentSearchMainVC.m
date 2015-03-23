//
//  HPAgentSearchMainVC.m
//  HomePlannerApp
//
//  Created by Dhanesh Gosai on 15/03/15.
//  Copyright (c) 2015 BDPartners. All rights reserved.
//

#import "HPAgentSearchMainVC.h"
#import "HPAgentCell.h"

@interface HPAgentSearchMainVC ()

@end

@implementation HPAgentSearchMainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableDictionary *dictMenu = [[NSMutableDictionary alloc]init];
    [dictMenu setObject:@"City Estate Management" forKeyedSubscript:@"agent_name"];
    [dictMenu setObject:@"sender" forKeyedSubscript:@"chat_type"];
    [dictMenu setObject:@"agent1.jpg" forKeyedSubscript:@"agent_image"];
    
    NSMutableDictionary *dictMenu1 = [[NSMutableDictionary alloc]init];
    [dictMenu1 setObject:@"Harshil Estate " forKeyedSubscript:@"agent_name"];
    [dictMenu1 setObject:@"sender" forKeyedSubscript:@"chat_type"];
    [dictMenu1 setObject:@"agent2.jpg" forKeyedSubscript:@"agent_image"];
    
    NSMutableDictionary *dictMenu2 = [[NSMutableDictionary alloc]init];
    [dictMenu2 setObject:@"Metro Real Estate" forKeyedSubscript:@"agent_name"];
    [dictMenu2 setObject:@"sender" forKeyedSubscript:@"chat_type"];
    [dictMenu2 setObject:@"agent3.jpg" forKeyedSubscript:@"agent_image"];
    
    NSMutableDictionary *dictMenu3 = [[NSMutableDictionary alloc]init];
    [dictMenu3 setObject:@"Perfect Consultant." forKeyedSubscript:@"agent_name"];
    [dictMenu3 setObject:@"sender" forKeyedSubscript:@"chat_type"];
    [dictMenu3 setObject:@"agent4.jpg" forKeyedSubscript:@"agent_image"];
    
    NSMutableDictionary *dictMenu4 = [[NSMutableDictionary alloc]init];
    [dictMenu4 setObject:@"Mission Realty." forKeyedSubscript:@"agent_name"];
    [dictMenu4 setObject:@"sender" forKeyedSubscript:@"chat_type"];
    [dictMenu4 setObject:@"agent5.jpg" forKeyedSubscript:@"agent_image"];
    
    NSMutableDictionary *dictMenu5 = [[NSMutableDictionary alloc]init];
    [dictMenu5 setObject:@"City Estate Management (Bopal)" forKeyedSubscript:@"agent_name"];
    [dictMenu5 setObject:@"sender" forKeyedSubscript:@"chat_type"];
    [dictMenu5 setObject:@"agent6.jpg" forKeyedSubscript:@"agent_image"];
    
    mutArrAgent     = [[NSMutableArray alloc]initWithObjects:dictMenu,dictMenu1,dictMenu2,dictMenu3,dictMenu4,dictMenu5, nil];
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
    return mutArrAgent.count;
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
    HPAgentCell *aHPAgentCell= (HPAgentCell*)[tableView dequeueReusableCellWithIdentifier:@"agentCell"];
    
    if (aHPAgentCell) {
        aHPAgentCell.lblName.text = [[mutArrAgent  objectAtIndex:indexPath.row]objectForKey:@"agent_name"];
        aHPAgentCell.lblSubTitle.text = [[mutArrAgent objectAtIndex:indexPath.row]objectForKey:@"chat_message"];
        aHPAgentCell.imgAgent.layer.cornerRadius = aHPAgentCell.imgAgent.frame.size.width/2;
        aHPAgentCell.imgAgent.layer.borderColor = [UIColor whiteColor].CGColor;
        aHPAgentCell.imgAgent.layer.borderWidth = 1;
        aHPAgentCell.imgAgent.layer.masksToBounds=YES;
        aHPAgentCell.imgAgent.image = [UIImage imageNamed:[[mutArrAgent objectAtIndex:indexPath.row]objectForKey:@"agent_image"]];
    }
    
    return aHPAgentCell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}


@end
