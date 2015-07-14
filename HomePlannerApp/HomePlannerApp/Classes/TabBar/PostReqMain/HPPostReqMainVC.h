//
//  HPPostReqMainVC.h
//  HomePlannerApp
//
//  Created by Dhanesh Gosai on 15/03/15.
//  Copyright (c) 2015 BDPartners. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HPPostReqMainVC : UIViewController{
    MBProgressHUD *hudProgress;
    NSMutableArray *mutArrPropertyReq;
}
@property (weak, nonatomic) IBOutlet UITableView *tblReqList;
@end
