//
//  Quote.m
//  MemorableQuotes
//
//  Created by Dale Ansley Lim on 11/24/15.
//  Copyright © 2015 Dale Ansley Lim. All rights reserved.
//

#import "Quote.h"

@implementation Quote
- (id)initQuote:(NSString *)newQuote initSource:(NSString *)newSource initCategory:(NSString *)newCategory {
    self = [super init];
    if(self) {
        [self setQuote:newQuote];
        [self setSourceReference:newSource];
        [self setCategory:newCategory];
    }
    return self;
}
@end
