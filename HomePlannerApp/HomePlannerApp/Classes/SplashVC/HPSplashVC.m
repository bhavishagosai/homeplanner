//
//  HPSplashVC.m
//  HomePlannerApp
//
//  Created by Dhanesh Gosai on 13/03/15.
//  Copyright (c) 2015 BDPartners. All rights reserved.
//

#import "HPSplashVC.h"
#import "HPLoginVC.h"

@interface HPSplashVC ()

@end

@implementation HPSplashVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [UIApplication sharedApplication].statusBarHidden = YES;
    self.navigationController.navigationBarHidden=YES;
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(50.0)), dispatch_get_main_queue(), ^{
//        [self performSegueWithIdentifier:@"LoginSegue" sender:nil];
//    });
    // Do any additional setup after loading the view.
    [self performSelector:@selector(gotoLoginScreen) withObject:nil afterDelay:0.5];
}

-(void)gotoLoginScreen{
    if ([PFUser currentUser]) {
        //        [self performSegueWithIdentifier:@"homeSegue" sender:nil];
        HPLoginVC *objHPLoginVC = [self.storyboard instantiateViewControllerWithIdentifier:@"HPLoginVC"];
        [self.navigationController pushViewController:objHPLoginVC animated:NO];
    }else{
        [self performSegueWithIdentifier:@"LoginSegue" sender:nil];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(BOOL)prefersStatusBarHidden{
    return YES;
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
