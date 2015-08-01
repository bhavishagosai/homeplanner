//
//  HPMessagesMainVC.h
//  HomePlannerApp
//
//  Created by Dhanesh Gosai on 15/03/15.
//  Copyright (c) 2015 BDPartners. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HPMessagesMainVC : UIViewController<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>{
    NSMutableArray *mutArrMessages;
}
@property (weak, nonatomic) IBOutlet UITableView *tblMessages;
@property (weak, nonatomic) IBOutlet UIButton *btnSendMessage;
@property (weak, nonatomic) IBOutlet UITextField *txtSendMessage;
@property (weak, nonatomic) IBOutlet UIView *viewButtom;
- (IBAction)btnSendMsgClick:(id)sender;

@end
