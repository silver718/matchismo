//
//  Deck.h
//  playcard
//
//  Created by Pei Qian on 6/11/14.
//  Copyright (c) 2014 Pei Qian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void)addCard:(Card *)card atTop:(BOOL)atTop;
- (void)addCard:(Card *)card;

- (Card *)drawRandomCard;

@end
