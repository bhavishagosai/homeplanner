//
//  HPHomeVC.h
//  HomePlannerApp
//
//  Created by Dhanesh Gosai on 13/03/15.
//  Copyright (c) 2015 BDPartners. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CHTumblrMenuView.h"
@class GADBannerView;


@interface HPHomeVC : UIViewController{
    CHTumblrMenuView *menuView;
}
@property(nonatomic, weak) IBOutlet GADBannerView *bannerView;
@property (weak, nonatomic) IBOutlet UIButton *btnLogOut;
- (IBAction)btnLogoutClick:(id)sender;
@end
