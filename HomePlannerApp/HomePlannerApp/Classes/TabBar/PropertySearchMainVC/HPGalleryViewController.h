//
//  HPGalleryViewController.h
//  HomePlannerApp
//
//  Created by Dhanesh Gosai on 20/06/15.
//  Copyright (c) 2015 BDPartners. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HPGalleryViewController : UIViewController<iCarouselDataSource,iCarouselDelegate>{
    NSMutableArray *mutArrPropertyImage;
    MBProgressHUD *hudProgress;
}
@property (strong, nonatomic) PFObject *selectedHome;
@property (strong, nonatomic) NSString *strNavigateFrom;
@property (weak, nonatomic) IBOutlet iCarousel *objCarosalView;
- (IBAction)segValueChanged:(UISegmentedControl *)sender;
@end
