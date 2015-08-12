//
//  HPAppDelegate.m
//  HomePlannerApp
//
//  Created by Dhanesh Gosai on 12/03/15.
//  Copyright (c) 2015 BDPartners. All rights reserved.
//

#import "HPAppDelegate.h"
#import <Parse/Parse.h>
#import <GoogleMaps/GoogleMaps.h>
#import <Fabric/Fabric.h>
#import <Crashlytics/Crashlytics.h>
#import <TwitterKit/TwitterKit.h>



@implementation HPAppDelegate
@synthesize selectedTab;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    appDelegate = self;
    
    [Fabric with:@[CrashlyticsKit, TwitterKit]];


    
    //Ad Integration
    [RevMobAds startSessionWithAppID:REVMOB_ID andDelegate:self];
    
    
    //Add Google Key
    [GMSServices provideAPIKey:@"AIzaSyDLChi5_BD8R9tTT51gWNWwaxy5kXBQ68o"];
    
    // ****************************************************************************
    // Fill in with your Parse and Twitter credentials. Don't forget to add your
    // Facebook id in Info.plist:
    // ****************************************************************************
    [Parse setApplicationId:@"glWGIJ96IEyMxhZZt58ieAe1TthOgB3AQGf5b0Nf" clientKey:@"9TXTKvCa6W4WQ2xacYiWv1juMdIhgD7BsT5lDsM0"];
//    [PFFacebookUtils initializeFacebook];
//    [PFTwitterUtils initializeWithConsumerKey:@"your_twitter_consumer_key" consumerSecret:@"your_twitter_consumer_secret"];
    
    // Set default ACLs
    PFACL *defaultACL = [PFACL ACL];
    [defaultACL setPublicReadAccess:YES];
    [PFACL setDefaultACL:defaultACL withAccessForCurrentUser:YES];
    
    
    
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark CLLocationManagerDelegate 

- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation{
    
}
- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error{
    
}


#pragma mark --- RevMob Ads Delegate ---

-(void)revmobSessionIsStarted {
    NSLog(@"[RevMob Sample App] Session is started.");
}

- (void)revmobSessionNotStartedWithError:(NSError *)error {
    NSLog(@"[RevMob Sample App] Session failed to start: %@", error);
}

- (void)revmobAdDidFailWithError:(NSError *)error {
}

@end
