//
//  HPProjectCell.h
//  HomePlannerApp
//
//  Created by indianic on 3/23/15.
//  Copyright (c) 2015 BDPartners. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HPProjectCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UILabel *lblSubTitle;
@property (weak, nonatomic) IBOutlet UIImageView *imgProject;
@property (weak, nonatomic) IBOutlet UIImageView *imgTitleBack;
@end
