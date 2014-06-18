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

static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;

- (void)chooseCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index];
    
    if (!card.isMatched) {
        if (card.chosen) {
            card.chosen = NO;
        } else {
            // match against another card
            for (Card *othercard in self.cards) {
                if (othercard.isChosen && !othercard.isMatched) {
                    int matchscore = [card match:@[othercard]];
                    if (matchscore) {
                        self.score += matchscore * MATCH_BONUS;
                        card.matched = YES;
                        othercard.matched = YES;
                        NSLog(@"%@ & %@ are matched!", card.contents, othercard.contents);
                    } else {
                        self.score -= MISMATCH_PENALTY;
                        othercard.chosen = NO;
                        NSLog(@"%@  & %@ are unmatched!", card.contents, othercard.contents);
                    }
                    break; // can only choose 2 cards for now
                }
            }
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
        }
    }
}

- (Card *)cardAtIndex:(NSUInteger)index
{
    return (index < [self.cards count]) ? self.cards[index] : nil;
}

@end
