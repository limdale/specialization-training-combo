//
//  CustomView.m
//  ActCoolMenu
//
//  Created by Dale Ansley Lim on 11/26/15.
//  Copyright © 2015 Dale Ansley Lim. All rights reserved.
//


#import "CoolMenuView.h"

@implementation CoolMenuView
{
    UIButton *view1;
    UIButton *view2;
    UIButton *view3;
    UIButton *view4;
    UIImageView *logo;
    UIView *backgroundOverlay;
    UILabel *openLabel;
    UILabel *closeLabel;
    BOOL isMoving;
    BOOL isHidden;
    int viewWidth;
    int viewHeight;
}

- (id)initWithFrame:(CGRect)rect {
    self = [super initWithFrame:rect];
    if(self) {
        isMoving = NO;
        isHidden = YES;
        viewWidth = 75;
        viewHeight = 75;
        
        view1 = [[UIButton alloc] init];
        view1.frame = CGRectMake(viewWidth,
                                 0-viewHeight,
                                 viewWidth,
                                 viewHeight);
        [view1 setImage:[UIImage imageNamed:@"quote"] forState:UIControlStateNormal];
        
        view2 = [[UIButton alloc] init];
        view2.frame = CGRectMake(self.frame.size.width - 2*viewWidth,
                                 0-viewHeight,
                                 viewWidth,
                                 viewHeight);
        [view2 setImage:[UIImage imageNamed:@"text"] forState:UIControlStateNormal];
        
        view3 = [[UIButton alloc] init];
        view3.frame = CGRectMake(viewWidth,
                                 self.frame.size.height,
                                 viewWidth,
                                 viewHeight);
        view3.backgroundColor = [UIColor blueColor];
        
        view4 = [[UIButton alloc] init];
        view4.frame = CGRectMake(self.frame.size.width - 2*viewWidth,
                                 self.frame.size.height,
                                 viewWidth,
                                 viewHeight);
        view4.backgroundColor = [UIColor greenColor];
        
        view1.alpha = 0;
        view2.alpha = 0;
        view3.alpha = 0;
        view4.alpha = 0;
        
        [self setupSelectors];
        
        [self addSubview:view1];
        [self addSubview:view2];
        [self addSubview:view3];
        [self addSubview:view4];
        
        UIImage *backgroundImage = [UIImage imageNamed:@"background"];
        self.backgroundColor = [UIColor colorWithPatternImage:backgroundImage];
        
        backgroundOverlay = [[UIView alloc] init];
        backgroundOverlay.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
        backgroundOverlay.frame = CGRectMake(0,0,self.frame.size.width,self.frame.size.height);
        [self addSubview:backgroundOverlay];
        
        
        UIImage *logoImage = [UIImage imageNamed:@"logo"];
        logo = [[UIImageView alloc] initWithImage:logoImage];
        logo.frame = CGRectMake(self.frame.size.width/2 - viewWidth/2,
                                self.frame.size.height/2 - viewHeight/2,
                                viewWidth, viewHeight);
        [self addSubview:logo];
        
        openLabel = [[UILabel alloc] init];
        openLabel.text = @"Tap to start";
        openLabel.textColor = [UIColor whiteColor];
        [openLabel sizeToFit];
        openLabel.frame = CGRectMake(self.frame.size.width/2 - openLabel.bounds.size.width/2,
                                    self.frame.size.height/2 - openLabel.bounds.size.height/2 + viewHeight,
                                    openLabel.bounds.size.width, openLabel.bounds.size.height);
        [self addSubview:openLabel];
        
        closeLabel = [[UILabel alloc] init];
        closeLabel.text = @"Tap to close";
        closeLabel.textColor = [UIColor whiteColor];
        [closeLabel sizeToFit];
        closeLabel.frame = CGRectMake(self.frame.size.width/2 - closeLabel.bounds.size.width/2,
                                     self.frame.size.height,
                                     closeLabel.bounds.size.width, closeLabel.bounds.size.height);
        [self addSubview:closeLabel];
//        background = []
//        background.frame = CGRectMake(0,0,self.frame.size.width,self.frame.size.height);
        
    }
    return self;
}

- (void)setupSelectors {
    SEL sel = NSSelectorFromString(@"startMemorableQuotes");
    if([self respondsToSelector:sel]) {
        [view1 addTarget:self action:sel forControlEvents:UIControlEventTouchUpInside];
    }
    else {
        NSLog(@"This class does not yet have onButtonClick.");
    }
    
    sel = NSSelectorFromString(@"startTextStyler");
    if([self respondsToSelector:sel]) {
        [view2 addTarget:self action:sel forControlEvents:UIControlEventTouchUpInside];
    }
    else {
        NSLog(@"This class does not yet have onButtonClick.");
    }
}

- (void)startMemorableQuotes {
    [self.controllerDelegate startMemorableQuotesViewController];
}

- (void)startTextStyler {
    [self.controllerDelegate startTextStylerViewController];
}

- (void)hide {
    isMoving = YES;
    [UIButton animateWithDuration:1.0 animations:^{
        view1.frame = CGRectMake(viewWidth,
                                 0-viewHeight,
                                 viewWidth,
                                 viewHeight);
        view2.frame = CGRectMake(self.frame.size.width - 2*viewWidth,
                                 0-viewHeight,
                                 viewWidth,
                                 viewHeight);
        view3.frame = CGRectMake(viewWidth,
                                 self.frame.size.height,
                                 viewWidth,
                                 viewHeight);
        view4.frame = CGRectMake(self.frame.size.width - 2*viewWidth,
                                 self.frame.size.height,
                                 viewWidth,
                                 viewHeight);
        closeLabel.frame = CGRectMake(self.frame.size.width/2 - closeLabel.bounds.size.width/2,
                                     self.frame.size.height,
                                     closeLabel.bounds.size.width, closeLabel.bounds.size.height);

        view1.alpha = 0;
        view2.alpha = 0;
        view3.alpha = 0;
        view4.alpha = 0;
        logo.alpha = 1;
        backgroundOverlay.alpha = 1;
        openLabel.alpha = 1;
        closeLabel.alpha = 0;
    } completion:^(BOOL finished){
        isMoving = NO;
    }];
}

- (void)show {
    isMoving = YES;
    [UIButton animateWithDuration:1.0 animations:^{
        view1.frame = CGRectMake(viewWidth,
                                 self.frame.size.height/2 - 2*viewHeight,
                                 viewWidth,
                                 viewHeight);
        view2.frame = CGRectMake(self.frame.size.width - 2*viewWidth,
                                 self.frame.size.height/2 - 2*viewHeight,
                                 viewWidth,
                                 viewHeight);
        view3.frame = CGRectMake(viewWidth,
                                 self.frame.size.height/2 + 2*viewHeight,
                                 viewWidth,
                                 viewHeight);
        view4.frame = CGRectMake(self.frame.size.width - 2*viewWidth,
                                 self.frame.size.height/2 + 2*viewHeight,
                                 viewWidth,
                                 viewHeight);
        closeLabel.frame = CGRectMake(self.frame.size.width/2 - closeLabel.bounds.size.width/2,
                                     self.frame.size.height - closeLabel.bounds.size.height,
                                     closeLabel.bounds.size.width, closeLabel.bounds.size.height);

        view1.alpha = 1;
        view2.alpha = 1;
        view3.alpha = 1;
        view4.alpha = 1;
        logo.alpha = 0;
        backgroundOverlay.alpha = 0;
        openLabel.alpha = 0;
        closeLabel.alpha = 1;
    } completion:^(BOOL finished){
        isMoving = NO;
    }];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    if(isHidden && !isMoving) {
        [self show];
        isHidden = NO;
    }
    else if(!isHidden && !isMoving) {
        [self hide];
        isHidden = YES;
    }
}



/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end

