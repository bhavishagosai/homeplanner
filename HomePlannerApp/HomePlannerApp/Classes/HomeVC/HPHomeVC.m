//
//  HPHomeVC.m
//  HomePlannerApp
//
//  Created by Dhanesh Gosai on 13/03/15.
//  Copyright (c) 2015 BDPartners. All rights reserved.
//

#import "HPHomeVC.h"

@interface HPHomeVC ()

@end

@implementation HPHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.hidesBackButton=YES;
    
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
   [self showMenu];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showMenu
{
    CHTumblrMenuView *menuView = [[CHTumblrMenuView alloc] init];
    [menuView addMenuItemWithTitle:@"Property Search" andIcon:[UIImage imageNamed:@"property_search_icon.png"] andSelectedBlock:^{
        NSLog(@"Property Search selected");
        appDelegate.selectedTab=0;
        [self performSegueWithIdentifier:@"propertySegue" sender:nil];
    }];
    [menuView addMenuItemWithTitle:@"Near By Search" andIcon:[UIImage imageNamed:@"nearby_icon.png"] andSelectedBlock:^{
        NSLog(@"Near By Search selected");
        appDelegate.selectedTab=1;
        [self performSegueWithIdentifier:@"nearBySegue" sender:nil];
    }];
    [menuView addMenuItemWithTitle:@"Post Requirement" andIcon:[UIImage imageNamed:@"post_req_icon.png"] andSelectedBlock:^{
        NSLog(@"Post Requirement selected");
        appDelegate.selectedTab=2;
        [self performSegueWithIdentifier:@"postReqSegue" sender:nil];
        
    }];
    [menuView addMenuItemWithTitle:@"Agent Search" andIcon:[UIImage imageNamed:@"agent_search_icon.png"] andSelectedBlock:^{
        NSLog(@"Agent Search selected");
        appDelegate.selectedTab=3;
        [self performSegueWithIdentifier:@"agentSegue" sender:nil];
        
    }];
    [menuView addMenuItemWithTitle:@"Project Search" andIcon:[UIImage imageNamed:@"project_search_icon.png"] andSelectedBlock:^{
        NSLog(@"Project Search selected");
        appDelegate.selectedTab=4;
        [self performSegueWithIdentifier:@"projectSegue" sender:nil];
        
    }];
    [menuView addMenuItemWithTitle:@"Price Trends" andIcon:[UIImage imageNamed:@"price_trends_icon.png"] andSelectedBlock:^{
        NSLog(@"Price Trends selected");
        appDelegate.selectedTab=5;
        [self performSegueWithIdentifier:@"trendSegue" sender:nil];
        
    }];
    [menuView addMenuItemWithTitle:@"Favourite" andIcon:[UIImage imageNamed:@"favourite_icon.png"] andSelectedBlock:^{
        NSLog(@"Favourite selected");
        appDelegate.selectedTab=6;
        [self performSegueWithIdentifier:@"favouriteSegue" sender:nil];
        
    }];
    [menuView addMenuItemWithTitle:@"Messages" andIcon:[UIImage imageNamed:@"messages_icon.png"] andSelectedBlock:^{
        NSLog(@"Messages selected");
        appDelegate.selectedTab=7;
        [self performSegueWithIdentifier:@"messageSegue" sender:nil];
        
    }];
    [menuView addMenuItemWithTitle:@"Vaastu" andIcon:[UIImage imageNamed:@"vaastu_icon.png"] andSelectedBlock:^{
        NSLog(@"Vaastu selected");
        appDelegate.selectedTab=8;
        [self performSegueWithIdentifier:@"vaastuSegue" sender:nil];
        
    }];
    [menuView addMenuItemWithTitle:@"About Us" andIcon:[UIImage imageNamed:@"aboutus_icon.png"] andSelectedBlock:^{
        NSLog(@"Vaastu selected");
        appDelegate.selectedTab=8;
        [self performSegueWithIdentifier:@"vaastuSegue" sender:nil];
        
    }];
    [menuView addMenuItemWithTitle:@"Contact Us" andIcon:[UIImage imageNamed:@"ContactUs.png"] andSelectedBlock:^{
        NSLog(@"Vaastu selected");
        appDelegate.selectedTab=8;
        [self performSegueWithIdentifier:@"vaastuSegue" sender:nil];
        
    }];
    [menuView addMenuItemWithTitle:@"Settings" andIcon:[UIImage imageNamed:@"setting_icon.png"] andSelectedBlock:^{
        NSLog(@"Vaastu selected");
        appDelegate.selectedTab=8;
        [self performSegueWithIdentifier:@"vaastuSegue" sender:nil];
        
    }];
    
    
    [menuView show];
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
