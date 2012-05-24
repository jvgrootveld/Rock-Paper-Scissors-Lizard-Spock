//
//  HandSign.h
//  RockPaperScissors
//
//  Created by Justin van Grootveld on 5/22/12.
//  Copyright (c) 2012 Pro4all. All rights reserved.
//

#import <Foundation/Foundation.h>

enum
{
    RPSNone     = 1UL << 0,
    RPSRock     = 1UL << 1,
    RPSPaper    = 1UL << 2,
    RPSScissors = 1UL << 3,
    RPSLizard   = 1UL << 4,
    RPSSpock    = 1UL << 5
};
typedef NSUInteger RPSType;

@interface HandSign : NSObject

@property (nonatomic, assign) RPSType weakness;
@property (nonatomic, assign, readonly) RPSType type;

- (id)initWithType:(RPSType)type;
+ (HandSign *)createWithType:(RPSType)type;

+ (NSString *)nameForSign:(RPSType)type;
- (NSString *)name;
- (BOOL)hasWeakness:(RPSType)weakness;

- (UIImage *)image;

@end