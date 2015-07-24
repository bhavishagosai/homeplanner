//
//  HPREgisterVC.m
//  HomePlannerApp
//
//  Created by Dhanesh Gosai on 13/03/15.
//  Copyright (c) 2015 BDPartners. All rights reserved.
//

#import "HPREgisterVC.h"
#import "MLPAutoCompleteTextField.h"
#import "DEMOCustomAutoCompleteCell.h"
#import "DEMOCustomAutoCompleteObject.h"
#import "DEMODataSource.h"

@interface HPREgisterVC ()

@end

@implementation HPREgisterVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.scrMain.contentSize=CGSizeMake(self.scrMain.frame.size.width,self.scrMain.frame.size.height+50);
    
//    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick:)];
//    [self.view addGestureRecognizer:tapGesture];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShowWithNotification:) name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHideWithNotification:) name:UIKeyboardDidHideNotification object:nil];
    
     [self.txtState setBorderStyle:UITextBorderStyleRoundedRect];
    
    if ([[[UIDevice currentDevice] systemVersion] compare:@"6.0" options:NSNumericSearch] != NSOrderedAscending) {
        [self.txtState registerAutoCompleteCellClass:[DEMOCustomAutoCompleteCell class]
                                           forCellReuseIdentifier:@"CustomCellId"];
        [self.txtCountry registerAutoCompleteCellClass:[DEMOCustomAutoCompleteCell class]
                              forCellReuseIdentifier:@"CustomCellId"];
        [self.txtCity registerAutoCompleteCellClass:[DEMOCustomAutoCompleteCell class]
                                forCellReuseIdentifier:@"CustomCellId"];
    }
    else{
        //Turn off bold effects on iOS 5.0 as they are not supported and will result in an exception
        self.txtState.applyBoldEffectToAutoCompleteSuggestions = NO;
        self.txtCountry.applyBoldEffectToAutoCompleteSuggestions = NO;
        self.txtCity.applyBoldEffectToAutoCompleteSuggestions = NO;
    }

    // Do any additional setup after loading the view.
}

- (void)keyboardDidShowWithNotification:(NSNotification *)aNotification
{
//    [UIView animateWithDuration:0.3
//                          delay:0
//                        options:UIViewAnimationCurveEaseOut|UIViewAnimationOptionBeginFromCurrentState
//                     animations:^{
//                         CGPoint adjust;
//                         switch (self.interfaceOrientation) {
//                             case UIInterfaceOrientationLandscapeLeft:
//                                 adjust = CGPointMake(-110, 0);
//                                 break;
//                             case UIInterfaceOrientationLandscapeRight:
//                                 adjust = CGPointMake(110, 0);
//                                 break;
//                             default:
//                                 adjust = CGPointMake(0, -60);
//                                 break;
//                         }
//                         CGPoint newCenter = CGPointMake(self.view.center.x+adjust.x, self.view.center.y+adjust.y);
//                         [self.view setCenter:newCenter];
////                         [self.author setAlpha:0];
////                         [self.demoTitle setAlpha:0];
////                         [self.typeSwitch setAlpha:0];
//                         
//                     }
//                     completion:nil];
}


- (void)keyboardDidHideWithNotification:(NSNotification *)aNotification
{
//    [UIView animateWithDuration:0.3
//                          delay:0
//                        options:UIViewAnimationCurveEaseOut|UIViewAnimationOptionBeginFromCurrentState
//                     animations:^{
//                         CGPoint adjust;
//                         switch (self.interfaceOrientation) {
//                             case UIInterfaceOrientationLandscapeLeft:
//                                 adjust = CGPointMake(110, 0);
//                                 break;
//                             case UIInterfaceOrientationLandscapeRight:
//                                 adjust = CGPointMake(-110, 0);
//                                 break;
//                             default:
//                                 adjust = CGPointMake(0, 60);
//                                 break;
//                         }
//                         CGPoint newCenter = CGPointMake(self.view.center.x+adjust.x, self.view.center.y+adjust.y);
//                         [self.view setCenter:newCenter];
////                         [self.author setAlpha:1];
////                         [self.demoTitle setAlpha:1];
////                         [self.typeSwitch setAlpha:1];
//                     }
//                     completion:nil];
    
    if (selectedTextFiled == self.txtCountry) {
        [self.txtCountry setAutoCompleteTableViewHidden:NO];
    }else if(selectedTextFiled == self.txtState){
        [self.txtState setAutoCompleteTableViewHidden:NO];
    }else if(selectedTextFiled == self.txtCity){
        [self.txtCity setAutoCompleteTableViewHidden:NO];
    }
    
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
    }else if (self.txtCountry==textField) {
        self.scrMain.contentOffset=CGPointMake(0,(self.txtCountry.frame.origin.y-50));
    }else if (self.txtState==textField) {
        self.scrMain.contentOffset=CGPointMake(0,(self.txtState.frame.origin.y-50));
    }else if (self.txtCity==textField) {
        self.scrMain.contentOffset=CGPointMake(0,(self.txtCity.frame.origin.y-50));
    }else if (self.txtPincode==textField) {
        self.scrMain.contentOffset=CGPointMake(0,(self.txtPincode.frame.origin.y-50));
    }
    selectedTextFiled = textField;
    return YES;
}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
//    if (self.txtPhoneNo==textField) {
//        self.scrMain.contentOffset=CGPointMake(0,0);
//    }
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
    }else if(![self NSStringIsValidEmail:self.txtEmail.text]){
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Home Planner" message:@"Please enter valid email address." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
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
        
        actLoadingSimple = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
        [self.navigationController.view addSubview:actLoadingSimple];
        actLoadingSimple.delegate = self;
        actLoadingSimple.labelText = @"Creating New User...";
        [actLoadingSimple show:YES];
        
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
//        PFFile *profileImage = [PFFile fileWithName:@"bhavisha.png" contentsAtPath:[[NSBundle mainBundle]pathForResource:@"bhavisha" ofType:@"png"]];
//        [userSignUp setObject:profileImage forKey:@"user_photo"];
        [userSignUp signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            [actLoadingSimple hide:YES];
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

-(BOOL) NSStringIsValidEmail:(NSString *)checkString
{
    BOOL stricterFilter = NO;
    NSString *stricterFilterString = @"^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$";
    NSString *laxString = @"^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:checkString];
}

-(void)tapClick:(UITapGestureRecognizer*)tapGesture{
    [self.view endEditing:YES];
}

- (void)hudWasHidden:(MBProgressHUD *)hud {
    // Remove HUD from screen when the HUD was hidded
    [actLoadingSimple removeFromSuperview];
    actLoadingSimple = nil;
}

#pragma mark - MLPAutoCompleteTextField Delegate


- (BOOL)autoCompleteTextField:(MLPAutoCompleteTextField *)textField
          shouldConfigureCell:(UITableViewCell *)cell
       withAutoCompleteString:(NSString *)autocompleteString
         withAttributedString:(NSAttributedString *)boldedString
        forAutoCompleteObject:(id<MLPAutoCompletionObject>)autocompleteObject
            forRowAtIndexPath:(NSIndexPath *)indexPath;
{
    //This is your chance to customize an autocomplete tableview cell before it appears in the autocomplete tableview
    NSString *filename = [autocompleteString stringByAppendingString:@".png"];
    filename = [filename stringByReplacingOccurrencesOfString:@" " withString:@"-"];
    filename = [filename stringByReplacingOccurrencesOfString:@"&" withString:@"and"];
    [cell.imageView setImage:[UIImage imageNamed:filename]];
    
    return YES;
}

- (void)autoCompleteTextField:(MLPAutoCompleteTextField *)textField
  didSelectAutoCompleteString:(NSString *)selectedString
       withAutoCompleteObject:(id<MLPAutoCompletionObject>)selectedObject
            forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(selectedObject){
        NSLog(@"selected object from autocomplete menu %@ with string %@", selectedObject, [selectedObject autocompleteString]);
        [selectedTextFiled resignFirstResponder];
    } else {
        NSLog(@"selected string '%@' from autocomplete menu", selectedString);
        [selectedTextFiled resignFirstResponder];
    }
}
@end
