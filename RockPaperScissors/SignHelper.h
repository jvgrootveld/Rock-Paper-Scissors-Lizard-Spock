//
//  MessageHelper.h
//  RockPaperScissors
//
//  Created by Justin van Grootveld on 5/22/12.
//  Copyright (c) 2012 Pro4all. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HandSign.h"

typedef enum 
{
    PLAYER_WON = 1,
    PLAYER_LOSE,
    SIGN_SAME
} SignResult;

@interface SignHelper : NSObject

+ (NSString *)messageForWinner:(HandSign *)winner andLoser:(HandSign *)loser;
+ (SignResult)signResultForPlayerSign:(HandSign *)playerSign andComputerSign:(HandSign *)computerSign;

@end