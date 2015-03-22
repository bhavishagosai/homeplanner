//
//  HPFAQVC.m
//  HomePlannerApp
//
//  Created by Dhanesh Gosai on 22/03/15.
//  Copyright (c) 2015 BDPartners. All rights reserved.
//

#import "HPFAQVC.h"

@interface HPFAQVC ()

@end

@implementation HPFAQVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.webViewFAQ loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.indiaproperty.com/faq.php"]]];
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

@end
