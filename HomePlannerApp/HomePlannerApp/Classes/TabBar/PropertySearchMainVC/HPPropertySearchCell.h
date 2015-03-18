//
//  HPPropertySearchCell.h
//  HomePlannerApp
//
//  Created by Dhanesh Gosai on 19/03/15.
//  Copyright (c) 2015 BDPartners. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HPPropertySearchCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgProperty;
@property (weak, nonatomic) IBOutlet UILabel *lblPropertyName;
@property (weak, nonatomic) IBOutlet UILabel *lblPropLocality;
@property (weak, nonatomic) IBOutlet UILabel *lblSize;
@property (weak, nonatomic) IBOutlet UILabel *lblStatus;
@property (weak, nonatomic) IBOutlet UIButton *btnFavourite;

@end
