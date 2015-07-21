//
//  HPAgentSearchMainVC.h
//  HomePlannerApp
//
//  Created by Dhanesh Gosai on 15/03/15.
//  Copyright (c) 2015 BDPartners. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface HPAgentSearchMainVC : UIViewController<UITableViewDataSource,UITableViewDelegate,MFMessageComposeViewControllerDelegate,UIActionSheetDelegate>{
    NSMutableArray *mutArrAgent;
    
}
@property (weak, nonatomic) IBOutlet UITableView *tblAgent;

@end
