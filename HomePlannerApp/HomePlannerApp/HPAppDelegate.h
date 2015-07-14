//
//  HPAppDelegate.h
//  HomePlannerApp
//
//  Created by Dhanesh Gosai on 12/03/15.
//  Copyright (c) 2015 BDPartners. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <RevMobAds/RevMobAdsDelegate.h>

@interface HPAppDelegate : UIResponder <UIApplicationDelegate,RevMobAdsDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic,assign) int selectedTab;
@end
