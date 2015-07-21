//
//  HPAgentCell.h
//  HomePlannerApp
//
//  Created by Dhanesh Gosai on 23/03/15.
//  Copyright (c) 2015 BDPartners. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HPAgentCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UILabel *lblSubTitle;
@property (weak, nonatomic) IBOutlet UIImageView *imgAgent;
@property (weak, nonatomic) IBOutlet UIButton *btnWhatsApp;
@property (weak, nonatomic) IBOutlet UIButton *btnContact;
@end
