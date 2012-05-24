//
//  Player.m
//  RockPaperScissors
//
//  Created by Justin van Grootveld on 5/22/12.
//  Copyright (c) 2012 Pro4all. All rights reserved.
//

#import "Player.h"

@implementation Player

@synthesize name = _name;
@synthesize score = _score;

- (id)initWithName:(NSString *)name
{
    if (self = [super init]) 
    {
        _name = name;
    }
    return self;
}

+ (Player *)createWithName:(NSString *)name
{
    return [[Player alloc] initWithName:name];
}

- (void)addPointToScore
{
    _score++;   
}

- (void)resetScore
{
    _score = 0;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"Player: %@ (%d)", _name, _score];
}

@end
