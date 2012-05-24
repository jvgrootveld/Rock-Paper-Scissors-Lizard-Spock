//
//  Player.h
//  RockPaperScissors
//
//  Created by Justin van Grootveld on 5/22/12.
//  Copyright (c) 2012 Pro4all. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject

@property(nonatomic, strong, readonly) NSString *name;
@property(nonatomic, assign, readonly) NSInteger score;

- (id)initWithName:(NSString *)name;
+ (Player *)createWithName:(NSString *)name;

- (void)addPointToScore;
- (void)resetScore;

@end
