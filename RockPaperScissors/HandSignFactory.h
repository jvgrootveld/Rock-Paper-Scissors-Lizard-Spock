//
//  HandSignFactory.h
//  RockPaperScissors
//
//  Created by Justin van Grootveld on 5/23/12.
//  Copyright (c) 2012 Pro4all. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HandSign;

@interface HandSignFactory : NSObject

+ (HandSign *)createRockSign;
+ (HandSign *)createPaperSign;
+ (HandSign *)createScissorsSign;
+ (HandSign *)createLizardSign;
+ (HandSign *)createSpockSign;

@end
