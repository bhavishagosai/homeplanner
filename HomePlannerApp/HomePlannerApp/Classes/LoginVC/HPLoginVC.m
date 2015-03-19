//
//  HPLoginVC.m
//  HomePlannerApp
//
//  Created by Dhanesh Gosai on 13/03/15.
//  Copyright (c) 2015 BDPartners. All rights reserved.
//

#import "HPLoginVC.h"

@interface HPLoginVC ()

@end

@implementation HPLoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden=NO;
    self.navigationItem.hidesBackButton=YES;
    self.navigationController.navigationBar.barTintColor=[UIColor colorWithRed:0/255.0 green:204/255.0 blue:255/255.0 alpha:1.0];
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
//    actLoadingSimple = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
//    [self.navigationController.view addSubview:actLoadingSimple];
//    
//    actLoadingSimple.delegate = self;
//    actLoadingSimple.labelText = @"Login...";
//    [actLoadingSimple show:YES];
//    [PFUser logInWithUsernameInBackground:self.txtUserName.text password:self.txtPassword.text block:^(PFUser *user, NSError *error) {
//        [actLoadingSimple hide:YES];
//        if (!error) {
//            [self performSegueWithIdentifier:@"homeSegue" sender:nil];
//        }else{
//            UIAlertView *alert =[[UIAlertView alloc]initWithTitle:@"Home Planner" message:@"Username or password may be wrong. Please try again." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
//            [alert show];
//        }
//    }];
    [self performSegueWithIdentifier:@"homeSegue" sender:nil];
}

- (IBAction)btnSignUpClick:(id)sender {
    [self performSegueWithIdentifier:@"registerSegue" sender:nil];
}

#pragma mark - MBProgressHUDDelegate

- (void)hudWasHidden:(MBProgressHUD *)hud {
    // Remove HUD from screen when the HUD was hidded
    [actLoadingSimple removeFromSuperview];
    actLoadingSimple = nil;
}
@end
