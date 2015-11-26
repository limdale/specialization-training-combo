//
//  ListViewController.m
//  MemorableQuotes
//
//  Created by Dale Ansley Lim on 11/24/15.
//  Copyright © 2015 Dale Ansley Lim. All rights reserved.
//

#import "ListViewController.h"
#import "DetailViewController.h"
#import "Quotes.h"

@implementation ListViewController
{
    Quotes *quotes;
}

- (id) init {
    self = [super init];
    if(self) {
        quotes = [[Quotes alloc] init];
        //UITabBarItem *tab = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemMostViewed tag:2];
        UIImage *image = [UIImage imageNamed:@"ic_list"];
        UITabBarItem *tab = [[UITabBarItem alloc] initWithTitle:@"List" image:image tag:2];
        //UITabBarItem *item1 = [tabBar.items objectAtIndex:0];
        //[item1 setFinishedSelectedImage:selectedImage withFinishedUnselectedImage:unselectedImage];

        
        [self setTabBarItem:tab];
    }
    return self;
}

- (void)loadView {
    UITableView *tableView = [[UITableView alloc] init];
    [tableView setDataSource:self];
    [tableView setDelegate:self];
    self.view = tableView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.textLabel.text = [[quotes getQuoteAtIndex:(int)indexPath.row] quote];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [quotes getQuotesArraySize];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"Clicked row %lu", indexPath.row);
    DetailViewController *detail = [[DetailViewController alloc] initWithQuote:[quotes getQuoteAtIndex:(int)indexPath.row]];
    [self.navigationController pushViewController:detail animated:YES];
}

@end
