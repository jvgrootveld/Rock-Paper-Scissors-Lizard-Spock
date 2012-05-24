//
//  MessageHelper.m
//  RockPaperScissors
//
//  Created by Justin van Grootveld on 5/22/12.
//  Copyright (c) 2012 Pro4all. All rights reserved.
//

#import "SignHelper.h"

@implementation SignHelper

+ (NSString *)messageForWinner:(HandSign *)winner andLoser:(HandSign *)loser
{
    if(winner.type == RPSNone || loser.type == RPSNone) 
        return @"Error: winner or loser has no type?";
    
    NSString *cause = @"";
    
    switch (winner.type) 
    {
        case RPSRock:
        {
            switch (loser.type) 
            {
                case RPSScissors:
                {
                    cause = @"crushes";
                    break;
                }
                case RPSLizard:
                {
                    cause = @"crushes";
                    break;
                }
            }
            break;
        }
        case RPSPaper:
        {
            switch (loser.type) 
            {
                case RPSRock:
                {
                    cause = @"covers";
                    break;
                }
                case RPSSpock:
                {
                    cause = @"disproves";
                    break;
                }
            }
            break;
        }
        case RPSScissors:
        {
            switch (loser.type) 
            {
                case RPSPaper:
                {
                    cause = @"cuts";
                    break;
                }
                case RPSLizard:
                {
                    cause = @"decapitates";
                    break;
                }
            }
            break;
        }
        case RPSLizard:
        {
            switch (loser.type) 
            {
                case RPSPaper:
                {
                    cause = @"eats";
                    break;
                }
                case RPSSpock:
                {
                    cause = @"poisons";
                    break;
                }
            }
            break;
        }
        case RPSSpock:
        {
            switch (loser.type) 
            {
                case RPSScissors:
                {
                    cause = @"smashes";
                    break;
                }
                case RPSRock:
                {
                    cause = @"vaporizes";
                    break;
                }
            }
            break;
        }
    }
    
    NSString *message = @"No winners";
    
    if(![cause isEqualToString:@""])
    {
        message = [NSString stringWithFormat:@"%@ %@ %@", winner.name, cause, loser.name];
    }
    
    return message;
}

+ (SignResult)signResultForPlayerSign:(HandSign *)playerSign andComputerSign:(HandSign *)computerSign
{
    SignResult result = PLAYER_LOSE;
    
    switch (playerSign.type) 
    {
        case RPSRock:
        {
            switch (computerSign.type) 
            {
                case RPSRock:
                {
                    result = SIGN_SAME;
                    break;
                }
                case RPSScissors:
                {
                    result = PLAYER_WON;
                    break;
                }
                case RPSLizard:
                {
                    result = PLAYER_WON;
                    break;
                }
            }
            break;
        }
        case RPSPaper:
        {
            switch (computerSign.type) 
            {
                case RPSPaper:
                {
                    result = SIGN_SAME;
                    break;
                }
                case RPSRock:
                {
                    result = PLAYER_WON;
                    break;
                }
                case RPSSpock:
                {
                    result = PLAYER_WON;
                    break;
                }
            }
            break;
        }
        case RPSScissors:
        {
            switch (computerSign.type) 
            {
                case RPSScissors:
                {
                    result = SIGN_SAME;
                    break;
                }
                case RPSPaper:
                {
                    result = PLAYER_WON;
                    break;
                }
                case RPSLizard:
                {
                    result = PLAYER_WON;
                    break;
                }
            }
            break;
        }
        case RPSLizard:
        {
            switch (computerSign.type) 
            {
                case RPSLizard:
                {
                    result = SIGN_SAME;
                    break;
                }
                case RPSPaper:
                {
                    result = PLAYER_WON;
                    break;
                }
                case RPSSpock:
                {
                    result = PLAYER_WON;
                    break;
                }
            }
            break;
        }
        case RPSSpock:
        {
            switch (computerSign.type) 
            {
                case RPSSpock:
                {
                    result = SIGN_SAME;
                    break;
                }
                case RPSScissors:
                {
                    result = PLAYER_WON;
                    break;
                }
                case RPSRock:
                {
                    result = PLAYER_WON;
                    break;
                }
            }
            break;
        }
    }
    
    return result;
}

@end
