//
//  Quotes.h
//  MemorableQuotes
//
//  Created by Dale Ansley Lim on 11/24/15.
//  Copyright © 2015 Dale Ansley Lim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Quote.h"

@interface Quotes : NSObject
@property NSMutableArray *quotesArray;
- (int)getQuotesArraySize;
- (Quote *)getQuoteAtIndex:(int)index;
- (void)addQuote:(Quote *)newQuote;
@end
