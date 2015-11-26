//
//  CustomViewController.h
//  ActCoolMenu
//
//  Created by Dale Ansley Lim on 11/26/15.
//  Copyright © 2015 Dale Ansley Lim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TextStylerViewController.h"
#import "CoolMenuControllerDelegate.h"

@interface CoolMenuViewController : UIViewController <CoolMenuControllerDelegate>
@property UITabBarController *tabViewController;
@property TextStylerViewController *textStylerViewController;
@property (weak) UINavigationController *navigationController;
@end
