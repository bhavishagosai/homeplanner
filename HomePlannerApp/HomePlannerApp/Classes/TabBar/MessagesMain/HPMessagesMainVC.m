//
//  HPMessagesMainVC.m
//  HomePlannerApp
//
//  Created by Dhanesh Gosai on 15/03/15.
//  Copyright (c) 2015 BDPartners. All rights reserved.
//

#import "HPMessagesMainVC.h"
#import "HPMessagesCell.h"

@interface HPMessagesMainVC ()

@end

@implementation HPMessagesMainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.btnSendMessage.layer.cornerRadius = 5.0;
    self.btnSendMessage.layer.masksToBounds = YES;
    
    NSMutableDictionary *dictMenu = [[NSMutableDictionary alloc]init];
    [dictMenu setObject:@"Hello Admin,I have one query regarding home loan." forKeyedSubscript:@"chat_message"];
    [dictMenu setObject:@"Dhanesh gosai" forKeyedSubscript:@"sender_name"];
    [dictMenu setObject:@"sender" forKeyedSubscript:@"chat_type"];
    [dictMenu setObject:@"dhanesh.png" forKeyedSubscript:@"sender_image"];
    
    NSMutableDictionary *dictMenu1 = [[NSMutableDictionary alloc]init];
    [dictMenu1 setObject:@"Hello Dhanesh,\nyes which type help you in home loan section." forKeyedSubscript:@"chat_message"];
    [dictMenu1 setObject:@"bhavisha" forKeyedSubscript:@"sender_name"];
    [dictMenu1 setObject:@"sender" forKeyedSubscript:@"chat_type"];
    [dictMenu1 setObject:@"bhavisha.png" forKeyedSubscript:@"sender_image"];
    
    NSMutableDictionary *dictMenu2 = [[NSMutableDictionary alloc]init];
    [dictMenu2 setObject:@"I want to know that as per my salary how much amount loan bank will sanction for me." forKeyedSubscript:@"chat_message"];
    [dictMenu2 setObject:@"Dhanesh gosai" forKeyedSubscript:@"sender_name"];
    [dictMenu2 setObject:@"sender" forKeyedSubscript:@"chat_type"];
    [dictMenu2 setObject:@"dhanesh.png" forKeyedSubscript:@"sender_image"];
    
    NSMutableDictionary *dictMenu3 = [[NSMutableDictionary alloc]init];
    [dictMenu3 setObject:@"Hey Dhanesh,\nCan you provide me your salary detail , so i can calculate loan amount." forKeyedSubscript:@"chat_message"];
    [dictMenu3 setObject:@"bhavisha" forKeyedSubscript:@"sender_name"];
    [dictMenu3 setObject:@"sender" forKeyedSubscript:@"chat_type"];
    [dictMenu3 setObject:@"bhavisha.png" forKeyedSubscript:@"sender_image"];
    
    NSMutableDictionary *dictMenu4 = [[NSMutableDictionary alloc]init];
    [dictMenu4 setObject:@"Ya sure,\nMy salary is 30,000/month." forKeyedSubscript:@"chat_message"];
    [dictMenu4 setObject:@"Dhanesh gosai" forKeyedSubscript:@"sender_name"];
    [dictMenu4 setObject:@"sender" forKeyedSubscript:@"chat_type"];
    [dictMenu4 setObject:@"dhanesh.png" forKeyedSubscript:@"sender_image"];
    
    NSMutableDictionary *dictMenu5 = [[NSMutableDictionary alloc]init];
    [dictMenu5 setObject:@"Thanks Dhanesh,\nfor providing detail will reply you soon with loan amount." forKeyedSubscript:@"chat_message"];
    [dictMenu5 setObject:@"bhavisha" forKeyedSubscript:@"sender_name"];
    [dictMenu5 setObject:@"sender" forKeyedSubscript:@"chat_type"];
    [dictMenu5 setObject:@"bhavisha.png" forKeyedSubscript:@"sender_image"];
    
    mutArrMessages = [[NSMutableArray alloc]initWithObjects:dictMenu,dictMenu1,dictMenu2,dictMenu3,dictMenu4,dictMenu5, nil];
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
    return mutArrMessages.count;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    switch (indexPath.row) {
//        case 0:
//            return 80;
//            break;
//        case 1:
//            return 90;
//            break;
//        case 2:
//            return 110;
//            break;
//        case 3:
//            return 100;
//            break;
//        case 4:
//            return 80;
//            break;
//        case 5:
//            return 105;
//            break;
//        default:
//            return 80;
//            break;
//    }
//}

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
    HPMessagesCell *aHPMessagesCell= (HPMessagesCell*)[tableView dequeueReusableCellWithIdentifier:@"messagesCell"];
    
    if (aHPMessagesCell) {
        aHPMessagesCell.lblTitle.text = [[mutArrMessages objectAtIndex:indexPath.row]objectForKey:@"sender_name"];
        aHPMessagesCell.lblSubTitle.text = [[mutArrMessages objectAtIndex:indexPath.row]objectForKey:@"chat_message"];
        aHPMessagesCell.imgUser.layer.cornerRadius = aHPMessagesCell.imgUser.frame.size.width/2;
        aHPMessagesCell.imgUser.layer.masksToBounds=YES;
        aHPMessagesCell.imgUser.image = [UIImage imageNamed:[[mutArrMessages objectAtIndex:indexPath.row]objectForKey:@"sender_image"]];
        
        switch (indexPath.row) {
            case 0:
                aHPMessagesCell.lblSubTitle.frame = CGRectMake(aHPMessagesCell.lblSubTitle.frame.origin.x,aHPMessagesCell.lblSubTitle.frame.origin.y,aHPMessagesCell.lblSubTitle.frame.size.width,40);
                break;
            case 1:
                aHPMessagesCell.lblSubTitle.frame = CGRectMake(aHPMessagesCell.lblSubTitle.frame.origin.x,aHPMessagesCell.lblSubTitle.frame.origin.y,aHPMessagesCell.lblSubTitle.frame.size.width,50);
                break;
            case 2:
                aHPMessagesCell.lblSubTitle.frame = CGRectMake(aHPMessagesCell.lblSubTitle.frame.origin.x,aHPMessagesCell.lblSubTitle.frame.origin.y,aHPMessagesCell.lblSubTitle.frame.size.width,55);
                break;
            case 3:
                aHPMessagesCell.lblSubTitle.frame = CGRectMake(aHPMessagesCell.lblSubTitle.frame.origin.x,aHPMessagesCell.lblSubTitle.frame.origin.y,aHPMessagesCell.lblSubTitle.frame.size.width,60);
                break;
            case 4:
                aHPMessagesCell.lblSubTitle.frame = CGRectMake(aHPMessagesCell.lblSubTitle.frame.origin.x,aHPMessagesCell.lblSubTitle.frame.origin.y,aHPMessagesCell.lblSubTitle.frame.size.width,90);
                break;
            case 5:
                aHPMessagesCell.lblSubTitle.frame = CGRectMake(aHPMessagesCell.lblSubTitle.frame.origin.x,aHPMessagesCell.lblSubTitle.frame.origin.y,aHPMessagesCell.lblSubTitle.frame.size.width,30);
                break;
            default:
                break;
        }
    }
    
    return aHPMessagesCell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

@end
