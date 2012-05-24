//
//  ComputerPlayer.h
//  RockPaperScissors
//
//  Created by Justin van Grootveld on 5/22/12.
//  Copyright (c) 2012 Pro4all. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Player.h"
#import "HandSign.h"

typedef enum
{
    DIFFICULT_EASY,
    DIFFICULT_MEDIUM,
    DIFFICULT_HARD
} ComputerDifficulty;

@interface ComputerPlayer : Player

+ (ComputerPlayer *)createEasyComputer;
+ (ComputerPlayer *)createMediumComputer;
+ (ComputerPlayer *)createHardComputer;

- (HandSign *)getHandsignWithPlayerSign:(HandSign *)playerSign andPossibleSigns:(NSDictionary *)possibleSigns;

@end
