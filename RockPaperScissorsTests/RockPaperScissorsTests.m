//
//  RockPaperScissorsTests.m
//  RockPaperScissorsTests
//
//  Created by Justin van Grootveld on 5/22/12.
//  Copyright (c) 2012 Pro4all. All rights reserved.
//

#import "RockPaperScissorsTests.h"
#import "HandSign.h"
#import "HandSignFactory.h"
#import "SignHelper.h"

@interface RockPaperScissorsTests()

@property (nonatomic, strong) HandSign *rock;
@property (nonatomic, strong) HandSign *paper;
@property (nonatomic, strong) HandSign *scissors;
@property (nonatomic, strong) HandSign *lizard;
@property (nonatomic, strong) HandSign *spock;

@end

@implementation RockPaperScissorsTests

@synthesize rock, paper, scissors, lizard, spock;

- (void)setUp
{
    [super setUp];
    
    rock = [HandSignFactory createRockSign];
    paper = [HandSignFactory createPaperSign];
    scissors = [HandSignFactory createScissorsSign];
    lizard = [HandSignFactory createLizardSign];
    spock = [HandSignFactory createSpockSign];
}

- (void)tearDown
{
    lizard = nil;
    paper = nil;
    scissors = nil;
    lizard = nil;
    spock = nil;
    
    [super tearDown];
}

- (void)textRockSign
{
    //Rock
    SignResult result = [SignHelper signResultForPlayerSign:rock andComputerSign:rock];
    STAssertEquals(result, SIGN_SAME, @"rock == rock");
    
    result = [SignHelper signResultForPlayerSign:rock andComputerSign:paper];
    STAssertEquals(result, PLAYER_LOSE, @"rock < paper");
    
    result = [SignHelper signResultForPlayerSign:rock andComputerSign:scissors];
    STAssertEquals(result, PLAYER_WON, @"rock > scissors");
    
    result = [SignHelper signResultForPlayerSign:rock andComputerSign:lizard];
    STAssertEquals(result, PLAYER_WON, @"rock > lizard");
    
    result = [SignHelper signResultForPlayerSign:rock andComputerSign:spock];
    STAssertEquals(result, PLAYER_LOSE, @"rock < spock");
}

- (void)textPaperSign
{
    //Paper
    SignResult result = [SignHelper signResultForPlayerSign:paper andComputerSign:paper];
    STAssertEquals(result, SIGN_SAME, @"paper == paper");
    
    result = [SignHelper signResultForPlayerSign:paper andComputerSign:rock];
    STAssertEquals(result, PLAYER_WON, @"paper > rock");
    
    result = [SignHelper signResultForPlayerSign:paper andComputerSign:scissors];
    STAssertEquals(result, PLAYER_LOSE, @"paper < scissors");
    
    result = [SignHelper signResultForPlayerSign:paper andComputerSign:lizard];
    STAssertEquals(result, PLAYER_LOSE, @"paper < lizard");
    
    result = [SignHelper signResultForPlayerSign:paper andComputerSign:spock];
    STAssertEquals(result, PLAYER_WON, @"paper > spock");
}

- (void)textScissorsSign
{
    //Scissors
    SignResult result = [SignHelper signResultForPlayerSign:scissors andComputerSign:scissors];
    STAssertEquals(result, SIGN_SAME, @"scissors == scissors");
    
    result = [SignHelper signResultForPlayerSign:scissors andComputerSign:rock];
    STAssertEquals(result, PLAYER_LOSE, @"scissors < rock");
    
    result = [SignHelper signResultForPlayerSign:scissors andComputerSign:paper];
    STAssertEquals(result, PLAYER_WON, @"scissors > paper");
    
    result = [SignHelper signResultForPlayerSign:scissors andComputerSign:lizard];
    STAssertEquals(result, PLAYER_WON, @"scissors > lizard");
    
    result = [SignHelper signResultForPlayerSign:scissors andComputerSign:spock];
    STAssertEquals(result, PLAYER_LOSE, @"scissors < spock");
}

- (void)textLizardSign
{
    //Lizard
    SignResult result = [SignHelper signResultForPlayerSign:lizard andComputerSign:lizard];
    STAssertEquals(result, SIGN_SAME, @"lizard == lizard");
    
    result = [SignHelper signResultForPlayerSign:lizard andComputerSign:rock];
    STAssertEquals(result, PLAYER_LOSE, @"lizard < rock");
    
    result = [SignHelper signResultForPlayerSign:lizard andComputerSign:scissors];
    STAssertEquals(result, PLAYER_LOSE, @"lizard < scissors");
    
    result = [SignHelper signResultForPlayerSign:lizard andComputerSign:paper];
    STAssertEquals(result, PLAYER_WON, @"lizard > paper");
    
    result = [SignHelper signResultForPlayerSign:lizard andComputerSign:spock];
    STAssertEquals(result, PLAYER_WON, @"lizard > spock");
}

- (void)textSpockSign
{
    //Spock
    SignResult result = [SignHelper signResultForPlayerSign:spock andComputerSign:spock];
    STAssertEquals(result, SIGN_SAME, @"spock == spock");
    
    result = [SignHelper signResultForPlayerSign:spock andComputerSign:rock];
    STAssertEquals(result, PLAYER_WON, @"spock > rock");
    
    result = [SignHelper signResultForPlayerSign:spock andComputerSign:scissors];
    STAssertEquals(result, PLAYER_WON, @"spock > scissors");
    
    result = [SignHelper signResultForPlayerSign:spock andComputerSign:lizard];
    STAssertEquals(result, PLAYER_LOSE, @"spock < lizard");
    
    result = [SignHelper signResultForPlayerSign:spock andComputerSign:paper];
    STAssertEquals(result, PLAYER_LOSE, @"spock > paper");
}

@end
