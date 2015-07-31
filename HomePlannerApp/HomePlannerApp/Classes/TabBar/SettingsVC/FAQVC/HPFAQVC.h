//
//  HPFAQVC.h
//  HomePlannerApp
//
//  Created by Dhanesh Gosai on 22/03/15.
//  Copyright (c) 2015 BDPartners. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "SectionView.h"

@interface HPFAQVC : UIViewController<SectionView>{
    
}
@property (weak, nonatomic) IBOutlet UIWebView *webViewFAQ;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end
