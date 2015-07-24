//
//  HPPopUpDetailVC.m
//  HomePlannerApp
//
//  Created by Dhanesh Gosai on 23/07/15.
//  Copyright (c) 2015 BDPartners. All rights reserved.
//

#import "HPPopUpDetailVC.h"

@interface HPPopUpDetailVC ()

@end

@implementation HPPopUpDetailVC
@synthesize btnClocseBlockClick;
@synthesize btnCallBlockClick;
@synthesize btnSmsBlockClick;
@synthesize btnWhatsappBlockClick;


- (void)viewDidLoad {
    [super viewDidLoad];
    self.imgUser.layer.borderColor = [[UIColor colorWithRed:0/255.0 green:188.0/255.0 blue:212.0/255.0 alpha:1.0] CGColor];
    self.imgUser.layer.borderWidth = 3;
    
    self.btnClose.layer.borderColor = [[UIColor colorWithRed:0/255.0 green:188.0/255.0 blue:212.0/255.0 alpha:1.0] CGColor];
    self.btnClose.layer.borderWidth = 2;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnCallClick:(id)sender{
    btnCallBlockClick(self.btnCall);
}
- (IBAction)btnSmsClick:(id)sender{
    btnSmsBlockClick(self.btnSMS);
}
- (IBAction)btnWhatsAppClick:(id)sender{
    btnWhatsappBlockClick(self.btnWhatsApp);
}

- (IBAction)btnCloseClick:(id)sender{
    btnClocseBlockClick(self.btnClose);
}
@end
