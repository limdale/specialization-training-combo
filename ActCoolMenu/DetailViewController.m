//
//  DetailViewController.m
//  MemorableQuotes
//
//  Created by Dale Ansley Lim on 11/24/15.
//  Copyright © 2015 Dale Ansley Lim. All rights reserved.
//

#import "DetailViewController.h"

@implementation DetailViewController

- (id) initWithQuote:(Quote *)initQuote {
    self = [super init];
    if(self) {
        [self setQuote:[initQuote quote]];
        [self setSourceReference:[initQuote sourceReference]];
        [self setCategory:[initQuote category]];
    }
    return self;
}

- (void)loadView {
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor whiteColor];
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGRect rect;
    
    UILabel *quoteLabel = [[UILabel alloc] init];
    quoteLabel.text = _quote;
    [quoteLabel sizeToFit];
    rect = quoteLabel.frame;
    quoteLabel.frame = CGRectMake(screenRect.size.width/2 - rect.size.width/2, screenRect.size.height/2 - 100, rect.size.width, rect.size.height);
    [view addSubview:quoteLabel];
    
    UILabel *sourceLabel = [[UILabel alloc] init];
    sourceLabel.text = _sourceReference;
    [sourceLabel sizeToFit];
    rect = sourceLabel.frame;
    sourceLabel.frame = CGRectMake(screenRect.size.width/2 - rect.size.width/2, screenRect.size.height/2, rect.size.width, rect.size.height);
    [view addSubview:sourceLabel];
    
    UILabel *categoryLabel = [[UILabel alloc] init];
    categoryLabel.text = _category;
    [categoryLabel sizeToFit];
    rect = categoryLabel.frame;
    categoryLabel.frame = CGRectMake(screenRect.size.width/2 - rect.size.width/2, screenRect.size.height/2 + 100, rect.size.width, rect.size.height);
    [view addSubview:categoryLabel];
    
    self.view = view;
}

@end
