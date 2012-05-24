//
//  HandSignFactory.m
//  RockPaperScissors
//
//  Created by Justin van Grootveld on 5/23/12.
//  Copyright (c) 2012 Pro4all. All rights reserved.
//

#import "HandSignFactory.h"
#import "HandSign.h"

@implementation HandSignFactory

+ (HandSign *)createRockSign
{
    HandSign *sign = [HandSign createWithType:RPSRock];
    
    [sign setWeakness:  RPSSpock | 
                        RPSPaper];
    
    return sign;
}

+ (HandSign *)createPaperSign
{
    HandSign *sign = [HandSign createWithType:RPSPaper];
    
    [sign setWeakness:  RPSScissors | 
                        RPSLizard];
    
    return sign;
}

+ (HandSign *)createScissorsSign
{
    HandSign *sign = [HandSign createWithType:RPSScissors];
    
    [sign setWeakness:  RPSRock | 
                        RPSSpock];
    
    return sign;
}

+ (HandSign *)createLizardSign
{
    HandSign *sign = [HandSign createWithType:RPSLizard];
    
    [sign setWeakness:  RPSRock | 
                        RPSScissors];
    
    return sign;
}

+ (HandSign *)createSpockSign
{
    HandSign *sign = [HandSign createWithType:RPSSpock];
    
    [sign setWeakness:  RPSPaper | 
                        RPSLizard];
    
    return sign;
}

@end
