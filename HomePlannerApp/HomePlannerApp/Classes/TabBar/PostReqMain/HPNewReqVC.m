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
    myPickerView = [[UIPickerView alloc]init];
    myPickerView.dataSource = self;
    myPickerView.delegate = self;
    myPickerView.showsSelectionIndicator = YES;
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc]
                                   initWithTitle:@"Done" style:UIBarButtonItemStyleDone
                                   target:self action:@selector(done:)];
    UIToolbar *toolBar = [[UIToolbar alloc]initWithFrame:
                          CGRectMake(0, self.view.frame.size.height-
                                     myPickerView.frame.size.height-50, 320, 50)];
    [toolBar setBarStyle:UIBarStyleBlackOpaque];
    NSArray *toolbarItems = [NSArray arrayWithObjects:
                             doneButton, nil];
    [toolBar setItems:toolbarItems];
    self.txtPropertyType.inputView = myPickerView;
    self.txtPropertyType.inputAccessoryView = toolBar;
    txtSelected = self.txtPropertyType;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    if (textField.tag==1) {
        return YES;
    }else if (textField.tag==2) {
        return NO;
    }else if (textField.tag==3) {
        return NO;
    }else{
        return YES;
    }
}

-(void)done:(id)sender{
    [txtSelected.inputAccessoryView removeFromSuperview];
    [txtSelected.inputView removeFromSuperview];
    myPickerView = nil;
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
        return [arrayCity count];
    }else{
        return 0;
    }
    
}

#pragma mark- Picker View Delegate

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if (txtSelected.tag==1) {
        [txtSelected setText:[arrayPeopertyType objectAtIndex:row]];
    }else if(txtSelected.tag==2){
        [txtSelected setText:[arrayBadrooms     objectAtIndex:row]];
    }else if(txtSelected.tag==3){
       [txtSelected setText:[arrayCity objectAtIndex:row]];
    }else{
        [txtSelected setText:@""];
    }

}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:
(NSInteger)row forComponent:(NSInteger)component{
    if (txtSelected.tag==1) {
        return [arrayPeopertyType objectAtIndex:row];
    }else if(txtSelected.tag==2){
        return [arrayBadrooms objectAtIndex:row];
    }else if(txtSelected.tag==3){
        return [arrayCity objectAtIndex:row];
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
@end
