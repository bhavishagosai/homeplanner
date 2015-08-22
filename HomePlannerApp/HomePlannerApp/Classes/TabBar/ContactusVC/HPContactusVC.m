//
//  HPContactusVC.m
//  HomePlannerApp
//
//  Created by Dhanesh Gosai on 22/03/15.
//  Copyright (c) 2015 BDPartners. All rights reserved.
//

#import "HPContactusVC.h"

@interface HPContactusVC ()

@end

@implementation HPContactusVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.txtViewMessage.layer.cornerRadius = 5.0;
    self.btnSend.layer.cornerRadius = 5.0;
    self.txtViewMessage.placeholderText = @"Enter Your Message...";
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

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (IBAction)btnSendClick:(id)sender {
    self.txtCategory.text = @"";
    self.txtViewMessage.text = @""; 
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Home Planner" message:@"Your Message send successfully. Admin will replay you soon for the same." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}

- (IBAction)btnWhatsAppClick:(id)sender {
    NSURL *whatsappURL = [NSURL URLWithString:[@"whatsapp://" stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    if ([[UIApplication sharedApplication] canOpenURL: whatsappURL]) {
         NSURL *whatsappURL = [NSURL URLWithString:[@"whatsapp://send?text=Need a Contact Detail Please share me your contact." stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        [[UIApplication sharedApplication] openURL: whatsappURL];
    }else{
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Home Planner" message:@"Whatsapp app is not installed on your device." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
}

- (IBAction)btnFaceBookClick:(id)sender {
    NSURL *whatsappURL = [NSURL URLWithString:@"https://www.facebook.com/plannMyHome"];
    if ([[UIApplication sharedApplication] canOpenURL: whatsappURL]) {
        [[UIApplication sharedApplication] openURL: whatsappURL];
    }
}

- (IBAction)btnTwitterClick:(id)sender {
    NSURL *whatsappURL = [NSURL URLWithString:@"https://twitter.com/plannMyHome"];
    if ([[UIApplication sharedApplication] canOpenURL: whatsappURL]) {
        [[UIApplication sharedApplication] openURL: whatsappURL];
    }
}



@end
