//
//  HPPricedetailVC.m
//  HomePlannerApp
//
//  Created by indianic on 3/23/15.
//  Copyright (c) 2015 BDPartners. All rights reserved.
//

#import "HPPricedetailVC.h"

@interface HPPricedetailVC ()

@end

@implementation HPPricedetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *filepath = [[NSBundle mainBundle] pathForResource:[[self.dictDetail objectForKey:@"city_name"] stringByAppendingString:@"_trends"] ofType:@"html"];
    
    self.title = [self.dictDetail objectForKey:@"city_name"];
    [self.webViewDetail loadHTMLString:[[NSString alloc] initWithData:[NSData dataWithContentsOfFile:filepath] encoding:NSUTF8StringEncoding] baseURL:nil];
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
