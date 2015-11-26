//
//  AddQuoteViewController.m
//  ActCoolMenu
//
//  Created by Dale Ansley Lim on 11/26/15.
//  Copyright © 2015 Dale Ansley Lim. All rights reserved.
//

#import "AddQuoteViewController.h"
#import "Quotes.h"

@implementation AddQuoteViewController
{
    CGRect screenRect;
    UIView *view;
    UITextField *quoteTextField;
    UITextField *sourceTextField;
    UIButton *addButton;
    Quotes *quotes;
}

- (id)init {
    self = [super init];
    if(self) {
        screenRect = [[UIScreen mainScreen] bounds];
        quoteTextField = [[UITextField alloc] init];
        sourceTextField = [[UITextField alloc] init];
        addButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    }
    return self;
}

- (void)loadView {
    view = [[UIView alloc] init];
    view.backgroundColor = [UIColor whiteColor];
        
    quoteTextField.placeholder = @"Enter your quote...";
    quoteTextField.delegate = self;
    [view addSubview:quoteTextField];
    
    sourceTextField.placeholder = @"Enter your quote source";
    sourceTextField.delegate = self;
    [view addSubview:sourceTextField];
    
    //rotationTextField.frame = CGRectMake(0, screenRect.size.height - 200 - offset, screenRect.size.width, 50);
    quoteTextField.frame = CGRectMake(0, 50, screenRect.size.width, 50);
    sourceTextField.frame = CGRectMake(0, 100, screenRect.size.width, 50);
    addButton.frame = CGRectMake(0, 150, screenRect.size.width, 50);
    [addButton setTitle:@"Add new quote!" forState:UIControlStateNormal];
    
    SEL sel = NSSelectorFromString(@"addNewQuote");
    if([self respondsToSelector:sel]) {
        [addButton addTarget:self action:sel forControlEvents:UIControlEventTouchUpInside];
    }
    else {
        NSLog(@"This class does not yet have onButtonClick.");
    }
    [view addSubview:addButton];
    
    self.view = view;
}

- (BOOL)textFieldShouldReturn:(UITextField *)aTextField {
    NSLog(@"pressed enter");
    //label.text = aTextField.text;
    [self.view endEditing:YES];
    return YES;
}

- (void)addNewQuote {
    [quotes addQuote:[[Quote alloc] initQuote:quoteTextField.text initSource:sourceTextField.text initCategory:@"Inspirational"]];
}

@end
