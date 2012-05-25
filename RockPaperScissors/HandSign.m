//
//  HandSign.m
//  RockPaperScissors
//
//  Created by Justin van Grootveld on 5/22/12.
//  Copyright (c) 2012 Pro4all. All rights reserved.
//

#import "HandSign.h"

@implementation HandSign

@synthesize weakness = _weakness;
@synthesize type = _type;

- (id)initWithType:(RPSType)type
{
    if (self = [super init]) 
    {
        _type = type;
        _weakness = RPSNone;
    }
    return self;
}

+ (HandSign *)createWithType:(RPSType)type
{
    return [[HandSign alloc] initWithType:type];
}

#pragma mark - public methods

+ (NSString *)nameForSign:(RPSType)type
{
    switch (type) 
    {
        case RPSRock:
        {
            return @"Rock";
            break;
        }
        case RPSPaper:
        {
            return @"Paper";
            break;
        }
        case RPSScissors:
        {
            return @"Scissors";
            break;
        }
        case RPSLizard:
        {
            return @"Lizard";
            break;
        }
        case RPSSpock:
        {
            return @"Spock";
            break;
        }
            default:
        return @"Unknown";
    }
}

- (NSString *)name
{
    return [HandSign nameForSign:self.type];
}

- (BOOL)hasWeakness:(RPSType)weakness
{
    return ((self.weakness & weakness) == weakness);
}

- (UIImage *)image
{
    NSString *imageName = [[HandSign nameForSign:self.type] lowercaseString];
    return [UIImage imageNamed:imageName];
}

@end
