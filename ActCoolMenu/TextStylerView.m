//
//  CustomView.m
//  ActTextStyler
//
//  Created by Dale Ansley Lim on 11/25/15.
//  Copyright © 2015 Dale Ansley Lim. All rights reserved.
//

#import "TextStylerView.h"
#import <CoreText/CoreText.h>

@implementation TextStylerView

- (id)init {
    self = [super init];
    if(self) {
        self.text = @"No text yet";
        self.font = @"Helvetica";
        self.fontColor = @"Black";
        self.fontSize = 20.0;
        self.rotation = 0.0;
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    CGContextRef c = UIGraphicsGetCurrentContext();

    CGContextSetRGBFillColor(c, 1, 1, 1, 1.0);
    CGContextSetRGBStrokeColor(c, 1, 1, 1, 1.0);
    CGContextFillRect(c, self.bounds);
    
    
    CTFontRef font = CTFontCreateWithName((CFStringRef)self.font, self.fontSize, NULL);
    CGContextSetTextMatrix(c, CGAffineTransformIdentity);
    
    CGContextTranslateCTM(c, self.bounds.size.width/2, self.bounds.size.height/2);
    CGContextScaleCTM(c, 1.0, -1.0);
    CGContextRotateCTM(c,self.rotation * M_PI/180.0);
    
    CGColorSpaceRef rgbColorSpace = CGColorSpaceCreateDeviceRGB();
    CGFloat components[] = {1.0, 0.0, 0.0, 1.0};
    [self getColorComponents:components withColor:self.fontColor];
    
    CGColorRef color = CGColorCreate(rgbColorSpace, components);
    CFStringRef keys[] = { kCTFontAttributeName, kCTForegroundColorAttributeName };
    CFTypeRef values[] = { font, color };
    CFDictionaryRef attributes = CFDictionaryCreate(kCFAllocatorDefault, (const void**)&keys,
                                                    (const void**)&values, sizeof(keys) / sizeof(keys[0]),
                                                    &kCFTypeDictionaryKeyCallBacks,
                                                    &kCFTypeDictionaryValueCallBacks);
    CFAttributedStringRef attrString = CFAttributedStringCreate(kCFAllocatorDefault, (CFStringRef)self.text, attributes);
    
    CFRelease((CFStringRef)self.text);
    CFRelease(attributes);
    
    CTLineRef line = CTLineCreateWithAttributedString(attrString);
    
    // Set text position and draw the line into the graphics context
    double width = CTLineGetTypographicBounds(line, NULL, NULL, NULL);
    CGContextSetTextPosition(c, -width/2, 0);
    CTLineDraw(line, c);
    CFRelease(line);
}

- (void)getColorComponents:(CGFloat *)components withColor:(NSString *)color {
    NSLog(@"changing to %@", color);
    if([color isEqualToString:@"Black"]) {
        components[0] = 0.0;
        components[1] = 0.0;
        components[2] = 0.0;
    }
    else if([color isEqualToString:@"Red"]) {
        components[0] = 1.0;
        components[1] = 0.0;
        components[2] = 0.0;
    }
    else if([color isEqualToString:@"Green"]) {
        components[0] = 0.0;
        components[1] = 1.0;
        components[2] = 0.0;
    }
    else if([color isEqualToString:@"Blue"]) {
        components[0] = 0.0;
        components[1] = 0.0;
        components[2] = 1.0;
    }
    else{
        components[0] = 0.0;
        components[1] = 0.0;
        components[2] = 0.0;
    }
}

@end
