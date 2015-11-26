//
//  CustomView.h
//  ActCoolMenu
//
//  Created by Dale Ansley Lim on 11/26/15.
//  Copyright © 2015 Dale Ansley Lim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoolMenuControllerDelegate.h"

@interface CoolMenuView : UIView
@property id<CoolMenuControllerDelegate> controllerDelegate;
@end
