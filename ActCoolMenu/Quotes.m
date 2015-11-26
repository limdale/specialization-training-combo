//
//  Quotes.m
//  MemorableQuotes
//
//  Created by Dale Ansley Lim on 11/24/15.
//  Copyright © 2015 Dale Ansley Lim. All rights reserved.
//

#import "Quotes.h"
#import "Quote.h"

@implementation Quotes
- (id)init {
    self = [super init];
    if(self) {
//        self.quotesArray = @[[[Quote alloc] initQuote:@"The mind is everything. What you think you become." initSource:@"Buddha" initCategory:@"Wisdom"],
//                         [[Quote alloc] initQuote:@"The best way to escape from a problem is to solve it." initSource:@"Alan Saporta" initCategory:@"Wisdom"],
//                         [[Quote alloc] initQuote:@"Your life does not get better by chance, it gets better by change." initSource:@"Jim Rohn" initCategory:@"Wisdom"],
//                         [[Quote alloc] initQuote:@"QE THE BEST" initSource:@"Al" initCategory:@"Inspirational"],
//                         [[Quote alloc] initQuote:@"Whatever the mind of man can conceive and believe, it can achieve." initSource:@"Napoleon Hill" initCategory:@"Inspirational"],
//                         [[Quote alloc] initQuote:@"You miss 100% of the shots you don’t take." initSource:@"Wayne Gretzky" initCategory:@"Inspirational"],
//                         [[Quote alloc] initQuote:@"test" initSource:@"test" initCategory:@"Misc"]];
        
        self.quotesArray = [[NSMutableArray alloc] init];
        [self.quotesArray addObject:[[Quote alloc] initQuote:@"The mind is everything. What you think you become." initSource:@"Buddha" initCategory:@"Wisdom"]];
        [self.quotesArray addObject:[[Quote alloc] initQuote:@"The best way to escape from a problem is to solve it." initSource:@"Alan Saporta" initCategory:@"Wisdom"]];
        [self.quotesArray addObject:[[Quote alloc] initQuote:@"Your life does not get better by chance, it gets better by change." initSource:@"Jim Rohn" initCategory:@"Wisdom"]];
        [self.quotesArray addObject:[[Quote alloc] initQuote:@"QE THE BEST" initSource:@"Al" initCategory:@"Inspirational"]];
        [self.quotesArray addObject:[[Quote alloc] initQuote:@"Whatever the mind of man can conceive and believe, it can achieve." initSource:@"Napoleon Hill" initCategory:@"Inspirational"]];
        [self.quotesArray addObject:[[Quote alloc] initQuote:@"test" initSource:@"test" initCategory:@"Misc"]];
        
    }
    return self;
}

- (int)getQuotesArraySize {
    return (int)[self.quotesArray count];
}

- (int)getQuerySetSize {
    return (int)[self.quotesArray count];
}

- (Quote *)getQuoteAtIndex:(int)index {
    return [self.quotesArray objectAtIndex:index];
}

- (void)addQuote:(Quote *)newQuote {
    [self.quotesArray addObject:newQuote];
}

@end
