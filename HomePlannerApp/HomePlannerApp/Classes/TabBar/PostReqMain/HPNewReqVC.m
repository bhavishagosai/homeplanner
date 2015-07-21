//
//  HPNewReqVC.m
//  HomePlannerApp
//
//  Created by indianic on 3/23/15.
//  Copyright (c) 2015 BDPartners. All rights reserved.
//

#import "HPNewReqVC.h"

@interface HPNewReqVC ()

@end

@implementation HPNewReqVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    arrayPeopertyType = [[NSMutableArray alloc]initWithObjects:@"Flats",@"Bunglow",@"Row House",@"Commercial", nil];
    arrayBadrooms = [[NSMutableArray alloc]initWithObjects:@"1",@"2",@"3",@"4",@"5",nil];
    arrayCity = [[NSMutableArray alloc]initWithObjects:@"Ahmedabad",@"Anand",@"Bhavnagar",@"Gandhinagar",@"Himatnagar",@"Jamnagar",@"Porbandar",@"Rajkot",@"Surat",@"Vadodra",nil];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    
    if (textField.tag==1 || textField.tag==2 || textField.tag==3 ) {
        [self.view endEditing:YES];
        [self done:nil];
        txtSelected = textField;
        myPickerView = [[UIPickerView alloc]initWithFrame:CGRectMake(0,self.view.frame.size.height,self.view.frame.size.width,216)];
        myPickerView.dataSource = self;
        myPickerView.delegate = self;
        myPickerView.showsSelectionIndicator = YES;
        myPickerView.backgroundColor = [UIColor colorWithRed:255.0/255.0 green:102.0/255.0 blue:102/255.0 alpha:1.0];
        UIBarButtonItem *doneButton = [[UIBarButtonItem alloc]
                                       initWithTitle:@"Done" style:UIBarButtonItemStyleDone
                                       target:self action:@selector(done:)];
        toolBar = [[UIToolbar alloc]initWithFrame:
                              CGRectMake(0, self.view.frame.size.height, 320, 44)];
        [toolBar setBarStyle:UIBarStyleBlackOpaque];
        NSArray *toolbarItems = [NSArray arrayWithObjects:
                                 doneButton, nil];
        [toolBar setItems:toolbarItems];
        
        [self.view addSubview:myPickerView];
        [self.view addSubview:toolBar];
        
        [UIView animateWithDuration:0.25 animations:^{
            myPickerView.frame = CGRectMake(0,self.view.frame.size.height-216,self.view.frame.size.width,216);
            toolBar.frame = CGRectMake(0, self.view.frame.size.height - myPickerView.frame.size.height-44, 320, 44);
        }];
        
        return NO;
    }else if(textField.tag==4){
        txtSelected = textField;
        UIBarButtonItem *doneButton = [[UIBarButtonItem alloc]
                                       initWithTitle:@"Done" style:UIBarButtonItemStyleDone
                                       target:self action:@selector(doneOnlyToolBar:)];
        toolBar = [[UIToolbar alloc]initWithFrame:
                   CGRectMake(0, self.view.frame.size.height, 320, 44)];
        [toolBar setBarStyle:UIBarStyleBlackOpaque];
        NSArray *toolbarItems = [NSArray arrayWithObjects:
                                 doneButton, nil];
        [toolBar setItems:toolbarItems];
        
        [self.view addSubview:myPickerView];
        [self.view addSubview:toolBar];
        
        [UIView animateWithDuration:0.25 animations:^{
            toolBar.frame = CGRectMake(0, self.view.frame.size.height - 216-44, 320, 44);
            self.scrMain.contentOffset = CGPointMake(0, 50);
        }];
        return YES;
    }
    else{
        return YES;
    }
}

-(void)doneOnlyToolBar:(id)sender{
    if (toolBar) {
        [UIView animateWithDuration:0.25 animations:^{
            [self.view endEditing:YES];
            toolBar.frame = CGRectMake(0, self.view.frame.size.height, 320, 50);
            self.scrMain.contentOffset = CGPointMake(0, 0);
        } completion:^(BOOL finished) {
            [toolBar removeFromSuperview];
            toolBar = nil;
        }];
    }
}


-(void)done:(id)sender{
    if (myPickerView) {
        [UIView animateWithDuration:0.25 animations:^{
            myPickerView.frame = CGRectMake(0,self.view.frame.size.height,self.view.frame.size.width,216);
            toolBar.frame = CGRectMake(0, self.view.frame.size.height, 320, 50);
        } completion:^(BOOL finished) {
            [toolBar removeFromSuperview];
            toolBar = nil;
            [myPickerView removeFromSuperview];
            myPickerView = nil;
        }];
    }
}

#pragma mark - Picker View Data source
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (txtSelected.tag==1) {
        return [arrayPeopertyType count];
    }else if(txtSelected.tag==2){
        return [arrayCity count];
    }else if(txtSelected.tag==3){
        return [arrayBadrooms count];
    }else{
        return 0;
    }
    
}

#pragma mark- Picker View Delegate

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if (txtSelected.tag==1) {
        [txtSelected setText:[arrayPeopertyType objectAtIndex:row]];
    }else if(txtSelected.tag==2){
        [txtSelected setText:[arrayCity     objectAtIndex:row]];
    }else if(txtSelected.tag==3){
       [txtSelected setText:[arrayBadrooms objectAtIndex:row]];
    }else{
        [txtSelected setText:@""];
    }

}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if (txtSelected.tag==1) {
        return [arrayPeopertyType objectAtIndex:row];
    }else if(txtSelected.tag==2){
        return [arrayCity objectAtIndex:row];
    }else if(txtSelected.tag==3){
        return [arrayBadrooms objectAtIndex:row];
    }else{
        return @"";
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnPropTypeClick:(UIButton *)sender {
    if (sender.tag==0) {
        self.btnRent.selected=YES;
        self.btnBuy.selected=NO;
    }else{
        self.btnRent.selected=NO;
        self.btnBuy.selected=YES;
    }
}

- (IBAction)btnNewReqPostClick:(UIButton *)sender {
//    Property_req
    hudProgress = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
    hudProgress.labelText = @"Adding New Req...";
    [self.navigationController.view addSubview:hudProgress];
    [hudProgress show:YES];
    PFObject *objNewProperty_req = [PFObject objectWithClassName:@"Property_req"];
    objNewProperty_req[@"Property_Type"] = self.txtPropertyType.text;
    objNewProperty_req[@"Post_Type"] = (self.btnRent.selected ? @"Rent" : @"Buy");
    objNewProperty_req[@"Req_City"] = self.txtCity.text;
    objNewProperty_req[@"Req_Bed"] = [NSNumber numberWithInteger:[self.txtBadrooms.text integerValue]];
    objNewProperty_req[@"Req_Size"] = self.txtPropertySize.text;
    objNewProperty_req[@"Notification"] = (self.btnNoti.selected ? [NSNumber numberWithBool:YES] : [NSNumber numberWithBool:NO]);
    objNewProperty_req[@"Email"] = (self.btnEmail.selected ? [NSNumber numberWithBool:YES] : [NSNumber numberWithBool:NO]);
    objNewProperty_req[@"reqUser"] = [PFUser currentUser];
    [objNewProperty_req saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            // The object has been saved.
            NSLog(@"Data Stored");
            UIImageView *imageView;
            UIImage *image = [UIImage imageNamed:@"37x-Checkmark.png"];
            imageView = [[UIImageView alloc] initWithImage:image];
            hudProgress.customView = imageView;
            hudProgress.mode = MBProgressHUDModeCustomView;
            hudProgress.labelText = @"New Req Added.";
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [hudProgress hide:YES];
                [hudProgress removeFromSuperview];
                [self.navigationController popViewControllerAnimated:YES];
            });
        } else {
            NSLog(@"Error in Data Store");
            hudProgress.labelText = @"Got An Error! Try Again.";
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [hudProgress hide:YES];
                [hudProgress removeFromSuperview];
            });
            // There was a problem, check error.description
        }
        
    }];
}

- (IBAction)btnNotificationClick:(UIButton*)sender {
    sender.selected = !sender.selected;
}

- (IBAction)btnEmailClick:(UIButton *)sender {
    sender.selected = !sender.selected;
}
@end
