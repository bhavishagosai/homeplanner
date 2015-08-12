//
//  HPLoginVC.m
//  HomePlannerApp
//
//  Created by Dhanesh Gosai on 13/03/15.
//  Copyright (c) 2015 BDPartners. All rights reserved.
//

#import "HPLoginVC.h"
#import "HPHomeVC.h"
#import <TwitterKit/TwitterKit.h>


@interface HPLoginVC ()

@end

@implementation HPLoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden=NO;
    self.navigationItem.hidesBackButton=YES;
    
    UINavigationBar *navBar = self.navigationController.navigationBar;
    UIImage *image = [UIImage imageNamed:@"navigationBar.png"];
    [navBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    
    self.btnSignIn.layer.cornerRadius = 5;
    self.btnSignIn.layer.masksToBounds=YES;
    
    self.btnSignUp.layer.cornerRadius = 5;
    self.btnSignUp.layer.masksToBounds=YES;
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick:)];
    [self.view addGestureRecognizer:tapGesture];
    
    if ([PFUser currentUser]) {
        if ([[[PFUser currentUser] objectForKey:@"emailVerified"] boolValue]) {
            HPHomeVC *objHPHomeVC = [self.storyboard instantiateViewControllerWithIdentifier:@"HPHomeVC"];
            [self.navigationController pushViewController:objHPHomeVC animated:NO];
        }
    }
    
//    TWTRLogInButton *logInButton = [TWTRLogInButton buttonWithLogInCompletion:^(TWTRSession *session, NSError *error) {
//        // play with Twitter session
//    }];
//    logInButton.center = self.view.center;
//    [self.view addSubview:logInButton];

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

- (IBAction)btnSignInClick:(id)sender {
    [self.view endEditing:YES];
    
    if ([self.txtUserName.text length]==0 && [self.txtPassword.text length]==0) {
        UIAlertView *alert =[[UIAlertView alloc]initWithTitle:@"Home Planner" message:@"Please enter username & password for login." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }else if ([self.txtUserName.text length]==0){
        UIAlertView *alert =[[UIAlertView alloc]initWithTitle:@"Home Planner" message:@"Username should not be blank.Please enter Username." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }else if (![self NSStringIsValidEmail:self.txtUserName.text]){
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Home Planner" message:@"Please enter valid email address." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
    }else if ([self.txtPassword.text length]==0){
        UIAlertView *alert =[[UIAlertView alloc]initWithTitle:@"Home Planner" message:@"Password should not be blank.Please enter Password." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }else{
        actLoadingSimple = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
        [self.navigationController.view addSubview:actLoadingSimple];
        
        actLoadingSimple.delegate = self;
        actLoadingSimple.labelText = @"Login...";
        [actLoadingSimple show:YES];
        [PFUser logInWithUsernameInBackground:[[self.txtUserName.text componentsSeparatedByString:@"@"] firstObject] password:self.txtPassword.text block:^(PFUser *user, NSError *error) {
            [actLoadingSimple hide:YES];
            
            if (!error) {
                if ([[user objectForKey:@"emailVerified"] boolValue]) {
                    [self performSegueWithIdentifier:@"homeSegue" sender:nil];
                }else{
                    UIAlertView *alert =[[UIAlertView alloc]initWithTitle:@"Home Planner" message:@"Registered email is not verified. Please verify email." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    [alert show];
                }
                
            }else{
                UIAlertView *alert =[[UIAlertView alloc]initWithTitle:@"Home Planner" message:@"Username or password may be wrong. Please try again." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert show];
            }
        }];
    }
}

-(BOOL) NSStringIsValidEmail:(NSString *)checkString
{
    BOOL stricterFilter = NO;
    NSString *stricterFilterString = @"^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$";
    NSString *laxString = @"^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:checkString];
}

- (IBAction)btnSignUpClick:(id)sender {
    [self performSegueWithIdentifier:@"registerSegue" sender:nil];
}

- (IBAction)btnForgetPasswordClick:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Forget Password" message:@"Please enter register email to reset password." delegate:self cancelButtonTitle:@"Send" otherButtonTitles:@"Cancel", nil];
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    alert.tag = 101;
    [alert show];
}

- (IBAction)btnSkipClick:(id)sender {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Home Planner" message:@"Oops! some feature will available after SignIn. Are you sure to skip SignIn ?" delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil];
        alert.tag = 105;
        [alert show];
//    [self performSegueWithIdentifier:@"homeSegue" sender:nil];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (alertView.tag==101) {
        if (buttonIndex==0) {
            UITextField *txtEmail = [alertView textFieldAtIndex:0];
            if([txtEmail.text length]>0){
                actLoadingSimple = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
                [self.navigationController.view addSubview:actLoadingSimple];
                
                actLoadingSimple.delegate = self;
                actLoadingSimple.labelText = @"Resetting Password...";
                [actLoadingSimple show:YES];
                [PFUser requestPasswordResetForEmailInBackground:txtEmail.text block:^(BOOL succeeded, NSError *error) {
                    [actLoadingSimple hide:YES];
                    if (!error) {
                        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Home Planner" message:@"Reset Password Link will be sent on email. Please check your email." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
                        [alert show];
                    }else{
                        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Home Planner" message:[NSString stringWithFormat:@"%@",[[error userInfo] objectForKey:@"error"]] delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
                        alert.tag=102;
                        [alert show];
                    }
                }];
            }
        }
    }else if(alertView.tag==102){
        if (buttonIndex==0) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self btnForgetPasswordClick:nil];
            });
        }
    }else if(alertView.tag==105){
        if (buttonIndex==1) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self performSegueWithIdentifier:@"homeSegue" sender:nil];
            });
           
        }
    }
    
}

-(void)tapClick:(UITapGestureRecognizer*)tapGesture{
    [self.view endEditing:YES];
}

#pragma mark - MBProgressHUDDelegate

- (void)hudWasHidden:(MBProgressHUD *)hud {
    // Remove HUD from screen when the HUD was hidded
    [actLoadingSimple removeFromSuperview];
    actLoadingSimple = nil;
}
@end
