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
    
    NSMutableDictionary *dictMenu1 = [[NSMutableDictionary alloc]init];
    [dictMenu1 setObject:[NSString stringWithFormat:@"Hello %@,\nHow can i help you ?",[[PFUser currentUser] username]] forKeyedSubscript:@"chat_message"];
    [dictMenu1 setObject:@"bhavisha" forKeyedSubscript:@"sender_name"];
    [dictMenu1 setObject:@"sender" forKeyedSubscript:@"chat_type"];
    [dictMenu1 setObject:@"bhavisha.png" forKeyedSubscript:@"sender_image"];
    
    mutArrMessages = [[NSMutableArray alloc]initWithObjects:dictMenu1, nil];
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
        
        if ([[[mutArrMessages objectAtIndex:indexPath.row] objectForKey:@"sender_image"] isKindOfClass:[PFFile class]   ]) {
            PFFile *file = [[mutArrMessages objectAtIndex:indexPath.row] objectForKey:@"sender_image"];
            [file getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
                if (!error) {
                    aHPMessagesCell.imgUser.image = [UIImage imageWithData:data];
                }
            }];
        }else{
            aHPMessagesCell.imgUser.image = [UIImage imageNamed:@"bhavisha"];
        }
        
        
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
    aHPMessagesCell.selectionStyle = UITableViewCellSelectionStyleNone;
    return aHPMessagesCell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.txtSendMessage resignFirstResponder];
}
#pragma mark - UITextView Method
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    [UIView animateWithDuration:0.3 animations:^{
        self.viewButtom.frame = CGRectMake(0,self.view.frame.size.height-self.viewButtom.frame.size.height-214, self.viewButtom.frame.size.width,self.viewButtom.frame.size.height);
    }];
    return YES;
}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    [UIView animateWithDuration:0.3 animations:^{
        self.viewButtom.frame = CGRectMake(0,self.view.frame.size.height-self.viewButtom.frame.size.height, self.viewButtom.frame.size.width,self.viewButtom.frame.size.height);
    }];
    return YES;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.txtSendMessage resignFirstResponder];
    return YES;
}


- (IBAction)btnSendMsgClick:(id)sender {
    
    if (self.txtSendMessage.text.length>0) {
        NSMutableDictionary *dictMenu5 = [[NSMutableDictionary alloc]init];
        [dictMenu5 setObject:self.txtSendMessage.text forKeyedSubscript:@"chat_message"];
        [dictMenu5 setObject:[[PFUser currentUser] username] forKeyedSubscript:@"sender_name"];
        [dictMenu5 setObject:@"sender" forKeyedSubscript:@"chat_type"];
        [dictMenu5 setObject:[[PFUser currentUser] objectForKey:@"user_photo"] forKeyedSubscript:@"sender_image"];
        
        [mutArrMessages addObject:dictMenu5];
        [self.tblMessages beginUpdates];
        [self.tblMessages insertRowsAtIndexPaths:[NSArray arrayWithObjects:[NSIndexPath indexPathForRow:mutArrMessages.count-1 inSection:0],nil] withRowAnimation:UITableViewRowAnimationAutomatic];
        [self.tblMessages endUpdates];
        
    }
    [self.txtSendMessage resignFirstResponder];
    self.txtSendMessage.text = @"";
    
//    [UIView animateWithDuration:0.5 animations:^{
//        self.viewButtom.frame = CGRectMake(0,self.view.frame.size.height-self.viewButtom.frame.size.height, self.viewButtom.frame.size.width,self.viewButtom.frame.size.height);
//    }];
}
@end
