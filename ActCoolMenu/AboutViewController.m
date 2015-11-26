//
//  AboutViewController.m
//  MemorableQuotes
//
//  Created by Dale Ansley Lim on 11/24/15.
//  Copyright © 2015 Dale Ansley Lim. All rights reserved.
//

#import "AboutViewController.h"

@implementation AboutViewController

{
    UIView *view;
    UILabel *label;
}

- (id) init {
    self = [super init];
    if(self) {
        UITabBarItem *tab = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemBookmarks tag:1];
        [self setTabBarItem:tab];
    }
    return self;
}

- (void)loadView {
    view = [[UIView alloc] init];
    view.backgroundColor = [UIColor whiteColor];
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGRect rect;
    
    label = [[UILabel alloc] init];
    label.numberOfLines = 3;
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"My name is Dale.\nI am now an iOS developer.\nI think.";
    [label sizeToFit];
    rect = label.frame;
    label.frame = CGRectMake(screenRect.size.width/2 - rect.size.width/2, screenRect.size.height/2, rect.size.width, rect.size.height);
    [view addSubview:label];
    self.view = view;
}

@end
