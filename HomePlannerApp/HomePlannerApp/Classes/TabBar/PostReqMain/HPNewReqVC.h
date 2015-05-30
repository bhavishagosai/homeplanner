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
    NSArray *arrayPeopertyType,*arrayBadrooms,*arrayCity;
    UITextField *txtSelected;
}
@property (weak, nonatomic) IBOutlet UITextField *txtPropertyType;
@property (weak, nonatomic) IBOutlet UITextField *txtCity;
@property (weak, nonatomic) IBOutlet UITextField *txtBadrooms;

@end
