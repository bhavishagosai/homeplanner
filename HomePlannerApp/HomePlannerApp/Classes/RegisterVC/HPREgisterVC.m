//
//  HPREgisterVC.m
//  HomePlannerApp
//
//  Created by Dhanesh Gosai on 13/03/15.
//  Copyright (c) 2015 BDPartners. All rights reserved.
//

#import "HPREgisterVC.h"

@interface HPREgisterVC ()

@end

@implementation HPREgisterVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.scrMain.contentSize=CGSizeMake(self.scrMain.frame.size.width,self.scrMain.frame.size.height+50);
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark UITextFieldDelegate methods

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    
    if (self.txtPhoneNo==textField) {
        self.scrMain.contentOffset=CGPointMake(0,(self.txtPhoneNo.frame.origin.y-50));
    }else if (self.txtStreet==textField) {
        self.scrMain.contentOffset=CGPointMake(0,(self.txtStreet.frame.origin.y-50));
    }else if (self.txtState==textField) {
        self.scrMain.contentOffset=CGPointMake(0,(self.txtState.frame.origin.y-50));
    }else if (self.txtCity==textField) {
        self.scrMain.contentOffset=CGPointMake(0,(self.txtCity.frame.origin.y-50));
    }else if (self.txtPincode==textField) {
        self.scrMain.contentOffset=CGPointMake(0,(self.txtPincode.frame.origin.y-50));
    }
    
    return YES;
}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
//    if (self.txtPhoneNo==textField) {
//        self.scrMain.contentOffset=CGPointMake(0,0);
//    }
    return YES;
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    return YES;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    
    return YES;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnSignUpClick:(id)sender {
    if (self.txtFirstName.text.length==0) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Home Planner" message:@"Please enter First name" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
    }else if (self.txtLastName.text.length==0) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Home Planner" message:@"Please enter Last name" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
    }else if (self.txtEmail.text.length==0) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Home Planner" message:@"Please enter Email" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
    }else if (self.txtPassword.text.length==0) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Home Planner" message:@"Please enter Password" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
    }else if (self.txtConfPassword.text.length==0) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Home Planner" message:@"Please enter Confirm Password" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
    }else if (![self.txtConfPassword.text isEqualToString:self.txtPassword.text]) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Home Planner" message:@"Password & Confirm Password should be same." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
    }else if (self.txtStreet.text.length==0) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Home Planner" message:@"Please enter Street" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
    }else if (self.txtState.text.length==0) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Home Planner" message:@"Please select State" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
    }else if (self.txtCity.text.length==0) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Home Planner" message:@"Please select City" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
    }else if (self.txtPincode.text.length==0) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Home Planner" message:@"Please select pincode" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
    }else{
        PFUser *userSignUp = [PFUser new];
        userSignUp.email =self.txtEmail.text;
        userSignUp.password = self.txtPassword.text;
        userSignUp.username = [[self.txtEmail.text componentsSeparatedByString:@"@"] firstObject];
        [userSignUp setObject:self.txtFirstName.text forKey:@"firstname"];
        [userSignUp setObject:self.txtLastName.text forKey:@"lastname"];
        [userSignUp setObject:self.txtPhoneNo.text forKey:@"phone_number"];
        [userSignUp setObject:self.txtPincode.text forKey:@"pincode"];
        [userSignUp setObject:self.txtState.text forKey:@"state"];
        [userSignUp setObject:self.txtStreet.text forKey:@"street"];
        PFFile *profileImage = [PFFile fileWithName:@"bhavisha.png" contentsAtPath:[[NSBundle mainBundle]pathForResource:@"bhavisha" ofType:@"png"]];
        [userSignUp setObject:profileImage forKey:@"user_photo"];
        [userSignUp signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if(!error){
                UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Home Planner" message:@"New User Created Successfully. Please login with your new user detail." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
                [alert show];
                [self.navigationController popViewControllerAnimated:YES];
            }else{
                UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Home Planner" message:[NSString stringWithFormat:@"%@",[error description]] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert show];
            }
        }];
    }
    
}
@end
