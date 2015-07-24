//
//  HPPopUpDetailVC.h
//  HomePlannerApp
//
//  Created by Dhanesh Gosai on 23/07/15.
//  Copyright (c) 2015 BDPartners. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HPPopUpDetailVC : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *imgUser;
@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UILabel *lblArea;
@property (weak, nonatomic) IBOutlet UIButton *btnClose;
@property (weak, nonatomic) IBOutlet UIButton *btnCall;
@property (weak, nonatomic) IBOutlet UIButton *btnSMS;
@property (weak, nonatomic) IBOutlet UIButton *btnWhatsApp;
@property (nonatomic,copy) void (^btnClocseBlockClick)(UIButton*);
@property (nonatomic,copy) void (^btnCallBlockClick)(UIButton*);
@property (nonatomic,copy) void (^btnSmsBlockClick)(UIButton*);
@property (nonatomic,copy) void (^btnWhatsappBlockClick)(UIButton*);
- (IBAction)btnCloseClick:(id)sender;
- (IBAction)btnCallClick:(id)sender;
- (IBAction)btnSmsClick:(id)sender;
- (IBAction)btnWhatsAppClick:(id)sender;

@end
