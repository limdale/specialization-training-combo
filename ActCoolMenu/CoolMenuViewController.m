//
//  CustomViewController.m
//  ActCoolMenu
//
//  Created by Dale Ansley Lim on 11/26/15.
//  Copyright © 2015 Dale Ansley Lim. All rights reserved.
//

#import "CoolMenuViewController.h"
#import "CoolMenuView.h"

@implementation CoolMenuViewController
{
    UIView *view;
    CoolMenuView *customView;
}

- (void)loadView {
    view = [[UIView alloc] init];
    view.backgroundColor = [UIColor whiteColor];
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    
    customView = [[CoolMenuView alloc] initWithFrame:screenRect];
    customView.frame = CGRectMake(0, 0, screenRect.size.width, screenRect.size.height);
    customView.controllerDelegate = self;
    [view addSubview:customView];
    
    self.view = view;
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

-(void)startMemorableQuotesViewController {
    NSLog(@"sdfasf");
    [self.navigationController pushViewController:self.tabViewController animated:YES];
}
-(void)startTextStylerViewController {
    [self.navigationController pushViewController:self.textStylerViewController animated:YES];
}

@end
