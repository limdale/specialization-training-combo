//
//  Quote.h
//  MemorableQuotes
//
//  Created by Dale Ansley Lim on 11/24/15.
//  Copyright © 2015 Dale Ansley Lim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Quote : NSObject
@property NSString *quote;
@property NSString *sourceReference;
@property NSString *category;
- (id)initQuote:(NSString *)newQuote initSource:(NSString *)newSource initCategory:(NSString *)newCategory;
@end
