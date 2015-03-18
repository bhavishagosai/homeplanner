//
//  HPPropertySearchMainVC.h
//  HomePlannerApp
//
//  Created by Dhanesh Gosai on 15/03/15.
//  Copyright (c) 2015 BDPartners. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HPPropertySearchCell.h"

@interface HPPropertySearchMainVC : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *mutArrProperty;
    NSInteger *lastSelectedIndex;
}
@property (weak, nonatomic) IBOutlet UITableView *tblPropertyList;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segFilter;
- (IBAction)segmentFilterValueChanged:(id)sender;
@end
