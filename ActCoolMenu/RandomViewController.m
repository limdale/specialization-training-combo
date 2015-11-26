//
//  RandomViewController.m
//  MemorableQuotes
//
//  Created by Dale Ansley Lim on 11/24/15.
//  Copyright © 2015 Dale Ansley Lim. All rights reserved.
//

#import "RandomViewController.h"
#import "Quotes.h"
#import "Quote.h"

@implementation RandomViewController
{
    UIView *view;
    Quotes *quotes;
    CGRect screenRect;
    NSArray *categoryArray;
}

- (id) init {
    self = [super init];
    if(self) {
        UIImage *image = [UIImage imageNamed:@"ic_help_outline"];
        UITabBarItem *tab = [[UITabBarItem alloc] initWithTitle:@"Random" image:image tag:1];
        [self setTabBarItem:tab];
        quotes = [[Quotes alloc] init];
        categoryArray = @[@"", @"", @""];
    }
    return self;
}

- (void)loadView {
    view = [[UIView alloc] init];
    view.backgroundColor = [UIColor whiteColor];
    screenRect = [[UIScreen mainScreen] bounds];
    CGRect rect;
    
    quote = [[UILabel alloc] init];
    quote.text = @"Welcome to Dale's Memorable Quotes!";
    quote.textAlignment = NSTextAlignmentCenter;
    quote.numberOfLines = 2;
    quote.lineBreakMode = NSLineBreakByWordWrapping;
    [quote sizeToFit];
    rect = quote.frame;
    quote.frame = CGRectMake(0, screenRect.size.height/2, screenRect.size.width, rect.size.height*2);
    [view addSubview:quote];
    
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"Click me!" forState:UIControlStateNormal];
    [button sizeToFit];
    rect = button.frame;
    button.frame = CGRectMake(screenRect.size.width/2 - rect.size.width/2, screenRect.size.height/2 + 100, rect.size.width, rect.size.height);
    
    SEL sel = NSSelectorFromString(@"onButtonClick");
    if([self respondsToSelector:sel]) {
        [button addTarget:self action:sel forControlEvents:UIControlEventTouchUpInside];
    }
    else {
        NSLog(@"This class does not yet have onButtonClick.");
    }
    [view addSubview:button];
    
    UIPickerView *picker = [[UIPickerView alloc] init];
    picker.frame = CGRectMake(0, 0, screenRect.size.width, 100);
    [view addSubview:picker];
    
    self.view = view;
}

- (void)onButtonClick {
    NSLog(@"change quote %d", arc4random_uniform([quotes getQuotesArraySize]));
    int index = arc4random_uniform([quotes getQuotesArraySize]);
    quote.text = [[quotes getQuoteAtIndex:index] quote];
    [quote setCenter:view.center];
}

@end
