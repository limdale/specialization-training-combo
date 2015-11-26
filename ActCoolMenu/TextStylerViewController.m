//
//  ViewController.m
//  ActTextStyler
//
//  Created by Dale Ansley Lim on 11/25/15.
//  Copyright © 2015 Dale Ansley Lim. All rights reserved.
//

#import "TextStylerViewController.h"
#import "TextStylerView.h"

@implementation TextStylerViewController
{
    UIView *view;
    CGRect screenRect;
    UITextField *textField;
    UITextField *rotationTextField;
    UIPickerView *fontPicker;
    UIPickerView *fontSizePicker;
    UIPickerView *fontColorPicker;
    TextStylerView *textStylerView;
    
    NSArray *fontArray;
    NSArray *fontSizeArray;
    NSArray *fontColorArray;
}

- (id)init {
    self = [super init];
    if(self) {
        screenRect = [[UIScreen mainScreen] bounds];
        textField = [[UITextField alloc] init];
        rotationTextField = [[UITextField alloc] init];
        textStylerView = [[TextStylerView alloc] init];
        fontPicker = [[UIPickerView alloc] init];
        fontSizePicker = [[UIPickerView alloc] init];
        fontColorPicker = [[UIPickerView alloc] init];
        
        fontArray = @[@"Helvetica", @"TimesNewRomanPSMT"];
        fontSizeArray = @[@"24", @"36", @"48"];
        fontColorArray = @[@"Black", @"Red", @"Green", @"Blue"];
        
        [self registerForKeyboardNotifications];
    }
    return self;
}

- (void)loadView {
    view = [[UIView alloc] init];
    view.backgroundColor = [UIColor whiteColor];

    [self moveViewsDown];
    
    [view addSubview:textStylerView];
    
    textField.placeholder = @"Enter something...";
    textField.delegate = self;
    [view addSubview:textField];
    
    rotationTextField.placeholder = @"Enter rotation";
    rotationTextField.delegate = self;
    [view addSubview:rotationTextField];
    
    fontPicker.delegate = self;
    [view addSubview:fontPicker];
    
    fontSizePicker.delegate = self;
    [view addSubview:fontSizePicker];
    
    fontColorPicker.delegate = self;
    [view addSubview:fontColorPicker];
    
    self.view = view;
}

- (void)registerForKeyboardNotifications {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWasShown:) name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillBeHidden:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)keyboardWasShown:(NSNotification *)aNotification {
    NSLog(@"keyboard");
    NSDictionary *info = [aNotification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    [self moveViewsUp:kbSize.height];
}

- (void)keyboardWillBeHidden:(NSNotification *)aNotification {
    NSLog(@"keyboard hidden");
    textField.frame = CGRectMake(50, screenRect.size.height - 50, screenRect.size.width, 50);
    textStylerView.frame = CGRectMake(0, 0, screenRect.size.width, screenRect.size.height);
    [self moveViewsDown];
}

- (BOOL)textFieldShouldReturn:(UITextField *)aTextField {
    NSLog(@"pressed enter");
    //label.text = aTextField.text;
    [self.view endEditing:YES];
    if(aTextField == textField) {
        [textStylerView setText:aTextField.text];
    }
    else if(aTextField == rotationTextField) {
        [textStylerView setRotation:[aTextField.text floatValue]];
    }
    [textStylerView setNeedsDisplay];
    return YES;
}

- (void)moveViewsUp:(float)offset {
    textField.frame = CGRectMake(50, screenRect.size.height - 50 - offset, screenRect.size.width - 50, 50);
    textStylerView.frame = CGRectMake(0, 0, screenRect.size.width, screenRect.size.height - offset);
    fontPicker.frame = CGRectMake(0, screenRect.size.height - 100 - offset, screenRect.size.width, 50);
    fontSizePicker.frame = CGRectMake(0, screenRect.size.height - 150 - offset, screenRect.size.width/2, 50);
    fontColorPicker.frame = CGRectMake(screenRect.size.width/2, screenRect.size.height - 150 - offset, screenRect.size.width/2, 50);
    rotationTextField.frame = CGRectMake(0, screenRect.size.height - 200 - offset, screenRect.size.width, 50);
}

- (void)moveViewsDown {
    textField.frame = CGRectMake(50, screenRect.size.height - 50, screenRect.size.width - 50, 50);
    textStylerView.frame = CGRectMake(0, 0, screenRect.size.width, screenRect.size.height);
    fontPicker.frame = CGRectMake(0, screenRect.size.height - 100, screenRect.size.width, 50);
    fontSizePicker.frame = CGRectMake(0, screenRect.size.height - 150, screenRect.size.width/2, 50);
    fontColorPicker.frame = CGRectMake(screenRect.size.width/2, screenRect.size.height - 150, screenRect.size.width/2, 50);
    rotationTextField.frame = CGRectMake(0, screenRect.size.height - 200, screenRect.size.width, 50);
}

- (int)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (int)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if(pickerView == fontPicker) {
        return (int)[fontArray count];
    }
    else if(pickerView == fontSizePicker) {
        return (int)[fontSizeArray count];
    }
    else if(pickerView == fontColorPicker) {
        return (int)[fontColorArray count];
    }
    return 1;
}

- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if(pickerView == fontPicker) {
        return fontArray[row];
    }
    else if(pickerView == fontSizePicker) {
        return fontSizeArray[row];
    }
    else if(pickerView == fontColorPicker) {
        return fontColorArray[row];
    }
    return fontArray[row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if(pickerView == fontPicker) {
        [textStylerView setFont:fontArray[row]];
    }
    else if(pickerView == fontSizePicker) {
        float size = [fontSizeArray[row] floatValue];
        [textStylerView setFontSize:size];
    }
    else if(pickerView == fontColorPicker) {
        [textStylerView setFontColor:fontColorArray[row]];
    }
    [textStylerView setNeedsDisplay];
}

@end
