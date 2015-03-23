//
//  HPMessagesMainVC.h
//  HomePlannerApp
//
//  Created by Dhanesh Gosai on 15/03/15.
//  Copyright (c) 2015 BDPartners. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HPMessagesMainVC : UIViewController<UITableViewDataSource,UITableViewDelegate>{
    NSMutableArray *mutArrMessages;
}
@property (weak, nonatomic) IBOutlet UIButton *btnSendMessage;

@end
