//
//  HPMyProfileVC.h
//  HomePlannerApp
//
//  Created by Dhanesh Gosai on 08/08/15.
//  Copyright (c) 2015 BDPartners. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HPMyProfileVC : UIViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIActionSheetDelegate,MBProgressHUDDelegate>{
    MBProgressHUD *actLoadingSimple;
}
@property (weak, nonatomic) IBOutlet UIScrollView *scrView;
@property (weak, nonatomic) IBOutlet UIButton *btnPhoto;
@property (weak, nonatomic) IBOutlet UITextField *txtFirstName;
@property (weak, nonatomic) IBOutlet UITextField *txtEmail;
@property (weak, nonatomic) IBOutlet UITextField *txtPhoneNub;
@property (weak, nonatomic) IBOutlet UIButton *btnSave;
@property (weak, nonatomic) IBOutlet UITextField *txtLastName;


- (IBAction)btnPhotoClick:(id)sender;
- (IBAction)btnSaveClick:(id)sender;
@end
