//
//  MasterViewController.m
//  StretchMyHeader
//
//  Created by Alex on 2015-07-14.
//  Copyright (c) 2015 Alex. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "NewsCell.h"
#import "NewsItem.h"

@interface MasterViewController ()
@property (weak, nonatomic) IBOutlet UILabel *date;

@property NSMutableArray *newsItems;
@end

@implementation MasterViewController

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.newsItems = [[NSMutableArray alloc] init];
    NewsItem *newsItem1 = [[NewsItem alloc] init];
    newsItem1.category = @"World";
    newsItem1.headline = @"Climate change protests, divestments meet fossil fuels realities";
    [self.newsItems addObject:newsItem1];
    NewsItem *newsItem2 = [[NewsItem alloc] init];
    newsItem2.category = @"Europe";
    newsItem2.headline = @"Scotland's 'Yes' leader says independence vote is 'once in a lifetime";
    [self.newsItems addObject:newsItem2];
    NewsItem *newsItem3 = [[NewsItem alloc] init];
    newsItem3.category = @"Middle East";
    newsItem3.headline = @"Airstrikes boost Islamic State, FBI director warns more hostages possible";
    [self.newsItems addObject:newsItem3];
    NewsItem *newsItem4 = [[NewsItem alloc] init];
    newsItem4.category = @"Africa";
    newsItem4.headline = @"Nigeria says 70 dead in building collapse; questions S. Africa victim claim";
    [self.newsItems addObject:newsItem4];
    NewsItem *newsItem5 = [[NewsItem alloc] init];
    newsItem5.category = @"Asia Pacific";
    newsItem5.headline = @"Despite UN ruling, Japan seeks backing for whale hunting";
    [self.newsItems addObject:newsItem5];
    NewsItem *newsItem6 = [[NewsItem alloc] init];
    newsItem6.category = @"Americas";
    newsItem6.headline = @"Officials: FBI is tracking 100 Americans who fought alongside IS in Syria";
    [self.newsItems addObject:newsItem6];
    NewsItem *newsItem7 = [[NewsItem alloc] init];
    newsItem7.category = @"World";
    newsItem7.headline = @"South Africa in $40 billion deal for Russian nuclear reactors";
    [self.newsItems addObject:newsItem7];
    NewsItem *newsItem8 = [[NewsItem alloc] init];
    newsItem8.category = @"Europe";
    newsItem8.headline = @"One million babies' created by EU student exchanges";
    [self.newsItems addObject:newsItem8];
    
    // Do any additional setup after loading the view, typically from a nib.
   // self.navigationItem.leftBarButtonItem = self.editButtonItem;
    NSString *dateString = [NSDateFormatter localizedStringFromDate:[NSDate date] dateStyle:NSDateFormatterMediumStyle timeStyle:NSDateFormatterNoStyle];
    self.date.text = dateString;

    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 40;
    [self.navigationController setNavigationBarHidden:YES animated:YES];

    
    [self.view layoutIfNeeded];

}

-(BOOL)prefersStatusBarHidden{
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender {
    if (!self.newsItems) {
        self.newsItems = [[NSMutableArray alloc] init];
    }
   // [self.objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NewsItem *newsItem = self.newsItems[indexPath.row];
        [[segue destinationViewController] setDetailItem:newsItem];
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.newsItems.count;
}

- (NewsCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NewsCell *newsCell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    NewsItem *newsItem = self.newsItems[indexPath.row];
    newsCell.headlineLabel.text = [newsItem headline];
    newsCell.categoryLabel.text = [newsItem category];
    
    return newsCell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.newsItems removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if(editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

@end
