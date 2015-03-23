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
        [self performSegueWithIdentifier:@"propertySegue" sender:nil];
    }];
    [menuView addMenuItemWithTitle:@"Near By Search" andIcon:[UIImage imageNamed:@"nearby_icon.png"] andSelectedBlock:^{
        NSLog(@"Near By Search selected");
        [self performSegueWithIdentifier:@"nearBySegue" sender:nil];
    }];
    [menuView addMenuItemWithTitle:@"Post Requirement" andIcon:[UIImage imageNamed:@"post_req_icon.png"] andSelectedBlock:^{
        NSLog(@"Post Requirement selected");
        [self performSegueWithIdentifier:@"postReqSegue" sender:nil];
        
    }];
    [menuView addMenuItemWithTitle:@"Agent Search" andIcon:[UIImage imageNamed:@"agent_search_icon.png"] andSelectedBlock:^{
        NSLog(@"Agent Search selected");
        [self performSegueWithIdentifier:@"agentMainSegue" sender:nil];
        
    }];
    [menuView addMenuItemWithTitle:@"Project Search" andIcon:[UIImage imageNamed:@"project_search_icon.png"] andSelectedBlock:^{
        NSLog(@"Project Search selected");
        [self performSegueWithIdentifier:@"projectSegue" sender:nil];
        
    }];
    [menuView addMenuItemWithTitle:@"Price Trends" andIcon:[UIImage imageNamed:@"price_trends_icon.png"] andSelectedBlock:^{
        NSLog(@"Price Trends selected");
        [self performSegueWithIdentifier:@"trendsSegue" sender:nil];
        
    }];
    [menuView addMenuItemWithTitle:@"Favourite" andIcon:[UIImage imageNamed:@"favourite_icon.png"] andSelectedBlock:^{
        NSLog(@"Favourite selected");
        [self performSegueWithIdentifier:@"favouriteSegue" sender:nil];
        
    }];
    [menuView addMenuItemWithTitle:@"Messages" andIcon:[UIImage imageNamed:@"messages_icon.png"] andSelectedBlock:^{
        NSLog(@"Messages selected");
        [self performSegueWithIdentifier:@"messagesSegue" sender:nil];
        
    }];
    [menuView addMenuItemWithTitle:@"Vaastu" andIcon:[UIImage imageNamed:@"vaastu_icon.png"] andSelectedBlock:^{
        NSLog(@"Vaastu selected");
        [self performSegueWithIdentifier:@"vaastuSegue" sender:nil];
        
    }];
    [menuView addMenuItemWithTitle:@"About Us" andIcon:[UIImage imageNamed:@"aboutus_icon.png"] andSelectedBlock:^{
        NSLog(@"About Us selected");
        [self performSegueWithIdentifier:@"aboutusSegue" sender:nil];
        
    }];
    [menuView addMenuItemWithTitle:@"Contact Us" andIcon:[UIImage imageNamed:@"ContactUs.png"] andSelectedBlock:^{
        NSLog(@"Vaastu selected");
        [self performSegueWithIdentifier:@"contactusSegue" sender:nil];
        
    }];
    [menuView addMenuItemWithTitle:@"Settings" andIcon:[UIImage imageNamed:@"setting_icon.png"] andSelectedBlock:^{
        NSLog(@"Vaastu selected");
        [self performSegueWithIdentifier:@"settingsSegue" sender:nil];
        
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
