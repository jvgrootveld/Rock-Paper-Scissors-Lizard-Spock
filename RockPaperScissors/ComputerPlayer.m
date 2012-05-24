//
//  ComputerPlayer.m
//  RockPaperScissors
//
//  Created by Justin van Grootveld on 5/22/12.
//  Copyright (c) 2012 Pro4all. All rights reserved.
//

#import "ComputerPlayer.h"
#import "HandSignFactory.h"
#import "GameController.h"
#import "HandSign.h"

@interface ComputerPlayer()

@property (nonatomic, assign) ComputerDifficulty difficulty;

@end

@implementation ComputerPlayer

@synthesize difficulty = _difficulty;

+ (ComputerPlayer *)createEasyComputer
{
    ComputerPlayer *computerPlayer = [[ComputerPlayer alloc] initWithName:@"Easy Bob"];
    
    [computerPlayer setDifficulty:DIFFICULT_EASY];
    
    return computerPlayer;
}

+ (ComputerPlayer *)createMediumComputer
{
    ComputerPlayer *computerPlayer = [[ComputerPlayer alloc] initWithName:@"Medium Bob"];
    
    [computerPlayer setDifficulty:DIFFICULT_MEDIUM];
    
    return computerPlayer;
}

+ (ComputerPlayer *)createHardComputer
{
    ComputerPlayer *computerPlayer = [[ComputerPlayer alloc] initWithName:@"Hard Bob"];
    
    [computerPlayer setDifficulty:DIFFICULT_HARD];
    
    return computerPlayer;
}

- (HandSign *)getHandsignWithPlayerSign:(HandSign *)playerSign andPossibleSigns:(NSDictionary *)possibleSigns
{
    //random shizzle
    __block HandSign *returnSign;
    
    int random = arc4random() % 100;
    
    NSArray *allKeys = possibleSigns.allKeys;
    NSString *randomKey = [allKeys objectAtIndex:(arc4random() % allKeys.count)];
    
    returnSign = [possibleSigns objectForKey:randomKey];
    
    if(self.difficulty == DIFFICULT_EASY && random < 75) //easy, player has 75 change to win
    {
        [possibleSigns enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) 
         {
             HandSign *sign = (HandSign *)obj;
             if([sign hasWeakness:playerSign.type])
             {
                 returnSign = sign;
                 return;
             }
         }];
    }
    else if(self.difficulty == DIFFICULT_HARD && random < 25) //hard, player has 25 change to win
    {
        [possibleSigns enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) 
         {
             HandSign *sign = (HandSign *)obj;
             if([playerSign hasWeakness:sign.type])
             {
                 returnSign = sign;
                 return;
             }
         }];
    }
    
    return returnSign;
}

@end
