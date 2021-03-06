//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Pei Qian on 6/11/14.
//  Copyright (c) 2014 Pei Qian. All rights reserved.
//

#import "CardGameViewController.h"
#import "Deck.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface CardGameViewController ()

@property (strong, nonatomic) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (nonatomic) int scorecount;

@property (weak, nonatomic) IBOutlet UILabel *messageLabel;

@property (weak, nonatomic) IBOutlet UISegmentedControl *cardMatchNumber;

@end

@implementation CardGameViewController
- (IBAction)Card2or3Segment:(UISegmentedControl *)sender {
}

- (IBAction)restart:(id)sender
{
    if (sender) self.game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count] usingDeck:[self createDeck]];
    [self updateUI];
    self.messageLabel.text = @"Choose two cards for matching!";
}

- (void)setScorecount:(int)scorecount
{
    _scorecount = scorecount;
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.scorecount];
    NSLog(@"Score changed to %d", self.scorecount);
}

- (CardMatchingGame *)game
{
    if (!_game) _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count] usingDeck:[self createDeck]];
    return _game;
}

- (Deck *)createDeck
{
    return [[PlayingCardDeck alloc] init];
}

- (IBAction)touchCardButton:(UIButton *)sender
{
    long cardIndex = [self.cardButtons indexOfObject:sender];
    Card *card_old = [self cardChosen];
    Card *card_new = [self.game cardAtIndex:cardIndex];
    [self.game chooseCardAtIndex:cardIndex];
    self.messageLabel.text = [self messageForMatching:card_new.isMatched card:card_new othercard:card_old];
    [self updateUI];
}

- (Card *)cardChosen
{
    Card *cardChosen;
    for (UIButton *cardButton in self.cardButtons)
    {
        long  cardIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardIndex];
        if (!card.isMatched && card.isChosen) {
            cardChosen = card;
        }
    }
    return cardChosen;
}

- (void)updateUI
{
    for (UIButton *cardButton in self.cardButtons)
    {
        long  cardIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
    }
    self.scorecount = self.game.score;
}

- (NSString *)titleForCard:(Card *)card
{
    return card.isChosen ? card.contents : @"";
}

- (UIImage *)backgroundImageForCard:(Card *)card
{
    return [UIImage imageNamed:card.isChosen ? @"cardfront" : @"cardback"];
}

- (NSString *)messageForMatching:(BOOL)isMatched card:(Card *)card othercard:(Card *)othercard
{
    if (!card.isChosen) return @"Choose two cards for matching!";
    else if (othercard == nil) return [NSString stringWithFormat:@"%@ is chosen!", card.contents];
    else
    return isMatched ? [NSString stringWithFormat:@"%@ & %@ are matched!", card.contents, othercard.contents] : [NSString stringWithFormat:@"%@ & %@ are unmatched!", card.contents, othercard.contents];
}

@end
