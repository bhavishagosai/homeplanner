//
//  HPVaastuDetailVC.h
//  HomePlannerApp
//
//  Created by Dhanesh Gosai on 22/03/15.
//  Copyright (c) 2015 BDPartners. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HPVaastuDetailVC : UIViewController
@property (weak, nonatomic) IBOutlet UIWebView *webViewVaastuDetail;
@property (nonatomic,strong) NSMutableDictionary *dictDetailData;
@end
