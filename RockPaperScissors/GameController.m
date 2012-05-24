//
//  GameController.m
//  RockPaperScissors
//
//  Created by Justin van Grootveld on 5/23/12.
//  Copyright (c) 2012 Pro4all. All rights reserved.
//

#import "GameController.h"
#import "HandSignFactory.h"
#import "HandSign.h"

@interface GameController()

@property (nonatomic, strong) NSDictionary *possibleSigns;

@end

@implementation GameController

@synthesize player = _player;
@synthesize computer = _computer;
@synthesize possibleSigns = _possibleSigns;
@synthesize gameType = _gameType;

- (id)initWithPlayer:(Player *)player andComputerPlayer:(ComputerPlayer *)computerPlayer
{
    if(self = [super init])
    {
        [self setPlayer:player];
        [self setComputer:computerPlayer];
    }
    return self;
}

+ (GameController *)createNormalGameWithPlayer:(Player *)player andComputerPlayer:(ComputerPlayer *)computerPlayer
{
    GameController *gameController = [[GameController alloc] initWithPlayer:player andComputerPlayer:computerPlayer];
    
    [gameController setGameType:GAME_NORMAL];
    
    //init en set signs
    NSMutableDictionary *signs = [NSMutableDictionary new];
    
    //Rock
    HandSign *sign = [HandSignFactory createRockSign];
    [signs setObject:sign forKey:[sign name]];
    
    //Paper
    sign = [HandSignFactory createPaperSign];
    [signs setObject:sign forKey:[sign name]];
    
    //Scissors
    sign = [HandSignFactory createScissorsSign];
    [signs setObject:sign forKey:[sign name]];
    
    gameController.possibleSigns = [NSDictionary dictionaryWithDictionary:signs];
    
    return gameController;
}

+ (GameController *)createLSGameWithPlayer:(Player *)player andComputerPlayer:(ComputerPlayer *)computerPlayer
{
    GameController *gameController = [[GameController alloc] initWithPlayer:player andComputerPlayer:computerPlayer];
    
    [gameController setGameType:GAME_LS];
    
    //init en set signs
    NSMutableDictionary *signs = [NSMutableDictionary new];
    
    //Rock
    HandSign *sign = [HandSignFactory createRockSign];
    [signs setObject:sign forKey:[sign name]];
    
    //Paper
    sign = [HandSignFactory createPaperSign];
    [signs setObject:sign forKey:[sign name]];
    
    //Scissors
    sign = [HandSignFactory createScissorsSign];
    [signs setObject:sign forKey:[sign name]];
    
    //Lizard
    sign = [HandSignFactory createLizardSign];
    [signs setObject:sign forKey:[sign name]];
    
    //Spock
    sign = [HandSignFactory createSpockSign];
    [signs setObject:sign forKey:[sign name]];
    
    
    gameController.possibleSigns = [NSDictionary dictionaryWithDictionary:signs];
    
    return gameController;
}



@end
