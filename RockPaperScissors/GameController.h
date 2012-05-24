//
//  GameController.h
//  RockPaperScissors
//
//  Created by Justin van Grootveld on 5/23/12.
//  Copyright (c) 2012 Pro4all. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef enum
{
    GAME_NORMAL,
    GAME_LS
} GameType;

@class Player;
@class ComputerPlayer;

@interface GameController : NSObject

@property (nonatomic, strong) Player *player;
@property (nonatomic, strong) ComputerPlayer *computer;
@property (nonatomic, assign) GameType gameType;

- (id)initWithPlayer:(Player *)player andComputerPlayer:(ComputerPlayer *)computerPlayer;
+ (GameController *)createNormalGameWithPlayer:(Player *)player andComputerPlayer:(ComputerPlayer *)computerPlayer;
+ (GameController *)createLSGameWithPlayer:(Player *)player andComputerPlayer:(ComputerPlayer *)computerPlayer;

- (NSDictionary *)possibleSigns;

@end
