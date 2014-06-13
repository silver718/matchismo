//
//  Card.h
//  playcard
//
//  Created by Pei Qian on 6/9/14.
//  Copyright (c) 2014 Pei Qian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;

@property (nonatomic, getter = isChosen) BOOL chosen;
@property (nonatomic, getter = isMatched) BOOL matched;

- (int)match:(NSArray *)otherCards;

@end
