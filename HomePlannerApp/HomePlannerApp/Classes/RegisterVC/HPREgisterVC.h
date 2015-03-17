//
//  HPREgisterVC.h
//  HomePlannerApp
//
//  Created by Dhanesh Gosai on 13/03/15.
//  Copyright (c) 2015 BDPartners. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HPREgisterVC : UIViewController<UITextFieldDelegate,UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *txtFirstName;
@property (weak, nonatomic) IBOutlet UITextField *txtLastName;
@property (weak, nonatomic) IBOutlet UITextField *txtEmail;
@property (weak, nonatomic) IBOutlet UITextField *txtPassword;
@property (weak, nonatomic) IBOutlet UITextField *txtConfPassword;
@property (weak, nonatomic) IBOutlet UITextField *txtPhoneNo;
@property (weak, nonatomic) IBOutlet UITextField *txtStreet;
@property (weak, nonatomic) IBOutlet UITextField *txtState;
@property (weak, nonatomic) IBOutlet UITextField *txtCity;
@property (weak, nonatomic) IBOutlet UITextField *txtPincode
;
@property (weak, nonatomic) IBOutlet UIScrollView *scrMain;

- (IBAction)btnSignUpClick:(id)sender;
@end
