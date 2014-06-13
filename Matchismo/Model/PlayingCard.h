//
//  PlayingCard.h
//  playcard
//
//  Created by Pei Qian on 6/11/14.
//  Copyright (c) 2014 Pei Qian. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;

@end
