//
//  HPFAQVC.m
//  HomePlannerApp
//
//  Created by Dhanesh Gosai on 22/03/15.
//  Copyright (c) 2015 BDPartners. All rights reserved.
//

#import "HPFAQVC.h"
#import "HPCategory.h"

#import "SectionInfo.h"

@interface HPFAQVC ()
@property (nonatomic, assign) NSInteger openSectionIndex;
@property (nonatomic, strong) NSMutableArray *sectionInfoArray;
@property (nonatomic, strong) NSArray *categoryList;

- (void) setCategoryArray;

@end

@implementation HPFAQVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setCategoryArray];
    self.tableView.sectionHeaderHeight = 45;
    self.tableView.sectionFooterHeight = 0;
    self.openSectionIndex = NSNotFound;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if ((self.sectionInfoArray == nil)|| ([self.sectionInfoArray count] != [self numberOfSectionsInTableView:self.tableView])) {
        NSMutableArray *array = [[NSMutableArray alloc] init];
        
        for (HPCategory *cat in self.categoryList) {
            SectionInfo *section = [[SectionInfo alloc] init];
            section.category = cat;
            section.open = NO;
            
            NSNumber *defaultHeight = [NSNumber numberWithInt:150];
            NSInteger count = [[section.category list] count];
            for (NSInteger i= 0; i<count; i++) {
                [section insertObject:defaultHeight inRowHeightsAtIndex:i];
            }
            
            [array addObject:section];
        }
        self.sectionInfoArray = array;
    }
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.categoryList count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    SectionInfo *array = [self.sectionInfoArray objectAtIndex:section];
    NSInteger rows = [[array.category list] count];
    return (array.open) ? rows : 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    HPCategory *category = (HPCategory *)[self.categoryList objectAtIndex:indexPath.section];
    cell.textLabel.text = [category.list objectAtIndex:indexPath.row];
    cell.textLabel.numberOfLines = 0;
    return cell;
}

-(CGFloat)tableView:(UITableView*)tableView heightForRowAtIndexPath:(NSIndexPath*)indexPath {
    SectionInfo *array = [self.sectionInfoArray objectAtIndex:indexPath.section];
    return [[array objectInRowHeightsAtIndex:indexPath.row] floatValue];
}

- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    SectionInfo *array  = [self.sectionInfoArray objectAtIndex:section];
    if (!array.sectionView)
    {
        NSString *title = array.category.name;
        array.sectionView = [[SectionView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.bounds.size.width, 45) WithTitle:title Section:section delegate:self];
    }
    return array.sectionView;
}
#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void) sectionClosed : (NSInteger) section{
    /*
     Create an array of the index paths of the rows in the section that was closed, then delete those rows from the table view.
     */
    SectionInfo *sectionInfo = [self.sectionInfoArray objectAtIndex:section];
    
    sectionInfo.open = NO;
    NSInteger countOfRowsToDelete = [self.tableView numberOfRowsInSection:section];
    
    if (countOfRowsToDelete > 0) {
        NSMutableArray *indexPathsToDelete = [[NSMutableArray alloc] init];
        for (NSInteger i = 0; i < countOfRowsToDelete; i++) {
            [indexPathsToDelete addObject:[NSIndexPath indexPathForRow:i inSection:section]];
        }
        [self.tableView deleteRowsAtIndexPaths:indexPathsToDelete withRowAnimation:UITableViewRowAnimationTop];
    }
    self.openSectionIndex = NSNotFound;
}

- (void) sectionOpened : (NSInteger) section
{
    SectionInfo *array = [self.sectionInfoArray objectAtIndex:section];
    
    array.open = YES;
    NSInteger count = [array.category.list count];
    NSMutableArray *indexPathToInsert = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i<count;i++)
    {
        [indexPathToInsert addObject:[NSIndexPath indexPathForRow:i inSection:section]];
    }
    
    NSMutableArray *indexPathsToDelete = [[NSMutableArray alloc] init];
    NSInteger previousOpenIndex = self.openSectionIndex;
    
    if (previousOpenIndex != NSNotFound)
    {
        SectionInfo *sectionArray = [self.sectionInfoArray objectAtIndex:previousOpenIndex];
        sectionArray.open = NO;
        NSInteger counts = [sectionArray.category.list count];
        [sectionArray.sectionView toggleButtonPressed:FALSE];
        for (NSInteger i = 0; i<counts; i++)
        {
            [indexPathsToDelete addObject:[NSIndexPath indexPathForRow:i inSection:previousOpenIndex]];
        }
    }
    UITableViewRowAnimation insertAnimation;
    UITableViewRowAnimation deleteAnimation;
    if (previousOpenIndex == NSNotFound || section < previousOpenIndex)
    {
        insertAnimation = UITableViewRowAnimationTop;
        deleteAnimation = UITableViewRowAnimationBottom;
    }
    else
    {
        insertAnimation = UITableViewRowAnimationBottom;
        deleteAnimation = UITableViewRowAnimationTop;
    }
    
    [self.tableView beginUpdates];
    [self.tableView insertRowsAtIndexPaths:indexPathToInsert withRowAnimation:insertAnimation];
    [self.tableView deleteRowsAtIndexPaths:indexPathsToDelete withRowAnimation:deleteAnimation];
    [self.tableView endUpdates];
    self.openSectionIndex = section;
    
}

- (void) setCategoryArray
{
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"CategoryList" withExtension:@"plist"];
    NSArray *mainArray = [[NSArray alloc] initWithContentsOfURL:url];
    NSMutableArray *categoryArray = [[NSMutableArray alloc] initWithCapacity:[mainArray count]];
    for (NSDictionary *dictionary in mainArray) {
        HPCategory *category = [[HPCategory alloc] init];
        category.name = [dictionary objectForKey:@"name"];
        category.list = [dictionary objectForKey:@"list"];
        [categoryArray addObject:category];
    }
    self.categoryList = categoryArray;
}


@end
