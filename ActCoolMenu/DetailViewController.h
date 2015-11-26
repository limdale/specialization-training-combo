//
//  DetailViewController.h
//  MemorableQuotes
//
//  Created by Dale Ansley Lim on 11/24/15.
//  Copyright © 2015 Dale Ansley Lim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Quote.h"

@interface DetailViewController : UIViewController
@property NSString* quote;
@property NSString* sourceReference;
@property NSString* category;
- (id)initWithQuote:(Quote *)quote;
@end
