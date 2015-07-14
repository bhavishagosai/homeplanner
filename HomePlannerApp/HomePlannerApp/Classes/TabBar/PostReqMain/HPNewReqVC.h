//
//  HPNewReqVC.h
//  HomePlannerApp
//
//  Created by indianic on 3/23/15.
//  Copyright (c) 2015 BDPartners. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HPNewReqVC : UIViewController<UITextFieldDelegate,UIPickerViewDataSource,UIPickerViewDelegate>{
    UIPickerView *myPickerView;
    UIToolbar *toolBar;
    NSArray *arrayPeopertyType,*arrayBadrooms,*arrayCity;
    UITextField *txtSelected;
    MBProgressHUD *hudProgress;
}
@property (weak, nonatomic) IBOutlet UITextField *txtPropertyType;
@property (weak, nonatomic) IBOutlet UITextField *txtCity;
@property (weak, nonatomic) IBOutlet UITextField *txtPropertySize;
@property (weak, nonatomic) IBOutlet UITextField *txtBadrooms;
@property (weak, nonatomic) IBOutlet UIButton *btnRent;
@property (weak, nonatomic) IBOutlet UIButton *btnBuy;
@property (weak, nonatomic) IBOutlet UIButton *btnNoti;
@property (weak, nonatomic) IBOutlet UIButton *btnEmail;
@property (weak, nonatomic) IBOutlet UIScrollView *scrMain;

- (IBAction)btnPropTypeClick:(UIButton *)sender;
- (IBAction)btnNewReqPostClick:(UIButton *)sender;
- (IBAction)btnNotificationClick:(UIButton*)sender;
- (IBAction)btnEmailClick:(UIButton *)sender;
@end
