//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Pei Qian on 6/13/14.
//  Copyright (c) 2014 Pei Qian. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, strong) NSMutableArray *cards; // of card
@end

@implementation CardMatchingGame

- (NSMutableArray *)cards
{
    if (!_cards) _cards = [[NSMutableArray alloc]init];
    return _cards;
}

- (instancetype)initWithCardCount:(NSInteger)count usingDeck:(Deck *)deck
{
    self = [super init];
    if (self) {
        for (int i=0; i < count; i++) {
            Card *card = [deck drawRandomCard];
            if (card) {
                [self.cards addObject:card];
            } else {
                self = nil;
                break;
            }
        }
    }
    return self;
}

- (void)chooseCardAtIndex:(NSUInteger)index
{
    
}

- (Card *)cardAtIndex:(NSUInteger)index
{
    
}

@end
