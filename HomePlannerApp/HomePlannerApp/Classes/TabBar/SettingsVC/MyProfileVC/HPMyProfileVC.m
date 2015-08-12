//
//  HPMyProfileVC.m
//  HomePlannerApp
//
//  Created by Dhanesh Gosai on 08/08/15.
//  Copyright (c) 2015 BDPartners. All rights reserved.
//

#import "HPMyProfileVC.h"

@interface HPMyProfileVC ()

@end

@implementation HPMyProfileVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"My Profile";
    self.btnPhoto.layer.cornerRadius = 50.0;
    self.btnPhoto.layer.masksToBounds = YES;
    PFFile *userPhoto = [[PFUser currentUser] objectForKey:@"user_photo"];
    [userPhoto getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
        if (!error) {
            [self.btnPhoto setBackgroundImage:[UIImage imageWithData:data] forState:UIControlStateNormal];
        }
    }];
    self.txtEmail.text = [[PFUser currentUser] email];
    self.txtFirstName.text = [[PFUser currentUser] objectForKey:@"firstname"];
    self.txtPhoneNub.text = [[PFUser currentUser] objectForKey:@"phone_number"];
    self.txtLastName.text = [[PFUser currentUser] objectForKey:@"lastname"];
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

- (IBAction)txtLastName:(id)sender {
}

- (IBAction)btnPhotoClick:(id)sender {
    UIActionSheet *actionSheet = [[UIActionSheet alloc]initWithTitle:@"Select option" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Take Photo" otherButtonTitles:@"Choose form Library", nil];
    actionSheet.tag = [sender tag];
    [actionSheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    switch (buttonIndex) {
        case 0:{
            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
                UIImagePickerController *imagePicker = [[UIImagePickerController alloc]init];
                imagePicker.delegate = self;
                imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
                imagePicker.editing = YES;
                [self presentViewController:imagePicker animated:YES completion:^{
                    
                }];
            }else{
                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Home Planner" message:@"Your device can not have camera feature!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert show];
            }
            
            break;
        }
            
        case 1:{
            UIImagePickerController *imagePicker = [[UIImagePickerController alloc]init];
            imagePicker.delegate = self;
            imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            imagePicker.editing = YES;
            [self presentViewController:imagePicker animated:YES completion:^{
                
            }];
            break;
        }
            
        default:{
            
        }
            
    }
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    NSLog(@"%@",info);
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    CGSize newSize = CGSizeMake(200.0f, 200.0f);
    UIGraphicsBeginImageContext(newSize);
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [self.btnPhoto setBackgroundImage:newImage forState:UIControlStateNormal];
    
    [picker dismissViewControllerAnimated:YES completion:^{
        
    }];
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    
}

- (IBAction)btnSaveClick:(id)sender {
    if (self.txtFirstName.text.length==0) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Home Planner" message:@"Please enter First name" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
    }else if (self.txtLastName.text.length==0) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Home Planner" message:@"Please enter Last name" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
    }else{
        
        actLoadingSimple = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
        [self.navigationController.view addSubview:actLoadingSimple];
        actLoadingSimple.delegate = self;
        actLoadingSimple.labelText = @"Updating your profile...";
        [actLoadingSimple show:YES];
        
        PFUser *firstObj = [PFUser currentUser];
        [firstObj setObject:self.txtFirstName.text forKey:@"firstname"];
        [firstObj setObject:self.txtLastName.text forKey:@"lastname"];
        [firstObj setObject:self.txtPhoneNub.text forKey:@"phone_number"];
        PFFile *profileImage = [PFFile fileWithData:UIImageJPEGRepresentation([self.btnPhoto backgroundImageForState:UIControlStateNormal], 0.5) contentType:@"image/jpeg"];
        [firstObj setObject:profileImage forKey:@"user_photo"];
        [firstObj saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            [actLoadingSimple hide:YES];
            if(!error){
                UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Home Planner" message:@"Your profile updated successfully." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
                [alert show];
            }else{
                UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Home Planner" message:[NSString stringWithFormat:@"%@",[error description]] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert show];
            }
        }];
    }

}
- (IBAction)txtEmail:(id)sender {
}
@end
