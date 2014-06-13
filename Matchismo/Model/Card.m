//
//  Card.m
//  playcard
//
//  Created by Pei Qian on 6/9/14.
//  Copyright (c) 2014 Pei Qian. All rights reserved.
//

#import "Card.h"

@interface Card()

@end

@implementation Card

- (int)match:(NSArray *)otherCards
{
    int score = 0;
    
    for (Card *card in otherCards) {
        if ([card.contents isEqualToString:self.contents]) {
        score = score + 1;
        }
    }
    
    return score;
}

@end
