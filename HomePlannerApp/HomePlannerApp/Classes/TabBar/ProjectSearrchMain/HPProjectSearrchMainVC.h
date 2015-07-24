//
//  HPProjectSearrchMainVC.h
//  HomePlannerApp
//
//  Created by Dhanesh Gosai on 15/03/15.
//  Copyright (c) 2015 BDPartners. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HPProjectSearrchMainVC : UIViewController<UITableViewDataSource,UITableViewDelegate>{
    NSMutableArray *mutArrProjectList;
    MBProgressHUD *hudProgress;
}

@property (weak, nonatomic) IBOutlet UITableView *tblProjectList;
@end
