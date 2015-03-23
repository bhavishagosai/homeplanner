//
//  HPPricedetailVC.h
//  HomePlannerApp
//
//  Created by indianic on 3/23/15.
//  Copyright (c) 2015 BDPartners. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HPPricedetailVC : UIViewController
@property (weak, nonatomic) IBOutlet UIWebView *webViewDetail;
@property(nonatomic,strong) NSMutableDictionary *dictDetail;
@end
