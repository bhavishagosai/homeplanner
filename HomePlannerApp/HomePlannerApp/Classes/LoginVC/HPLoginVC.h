//
//  HPLoginVC.h
//  HomePlannerApp
//
//  Created by Dhanesh Gosai on 13/03/15.
//  Copyright (c) 2015 BDPartners. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HPLoginVC : UIViewController<MBProgressHUDDelegate>{
    MBProgressHUD *actLoadingSimple;
}
@property (weak, nonatomic) IBOutlet UITextField *txtUserName;
@property (weak, nonatomic) IBOutlet UITextField *txtPassword;
@property (weak, nonatomic) IBOutlet UIButton *btnSignUp;
@property (weak, nonatomic) IBOutlet UIButton *btnSignIn;
@property (weak, nonatomic) IBOutlet UIButton *btnForgetPassword;
- (IBAction)btnSignInClick:(id)sender;
- (IBAction)btnSignUpClick:(id)sender;
- (IBAction)btnForgetPasswordClick:(id)sender;
- (IBAction)btnSkipClick:(id)sender;
@end
