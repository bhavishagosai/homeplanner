//
//  HPFavouriteMainVC.h
//  HomePlannerApp
//
//  Created by Dhanesh Gosai on 15/03/15.
//  Copyright (c) 2015 BDPartners. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HPFavouriteMainVC : UIViewController{
    NSMutableArray *mutArrProperty;
    NSInteger *lastSelectedIndex;
    MBProgressHUD *hudProgress;
}
@property (weak, nonatomic) IBOutlet UITableView *tblFavorite;

@end
