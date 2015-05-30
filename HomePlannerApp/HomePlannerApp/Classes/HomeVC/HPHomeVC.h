//
//  HPHomeVC.h
//  HomePlannerApp
//
//  Created by Dhanesh Gosai on 13/03/15.
//  Copyright (c) 2015 BDPartners. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CHTumblrMenuView.h"

@interface HPHomeVC : UIViewController{
    CHTumblrMenuView *menuView;
}
- (IBAction)btnLogoutClick:(id)sender;
@end
