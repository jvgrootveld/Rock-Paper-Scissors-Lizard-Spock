//
//  GameViewController.m
//  RockPaperScissors
//
//  Created by Justin van Grootveld on 5/22/12.
//  Copyright (c) 2012 Pro4all. All rights reserved.
//

#import "GameViewController.h"
#import "GameController.h"
#import "Player.h"
#import "ComputerPlayer.h"
#import "HandSignFactory.h"
#import "SignHelper.h"

const CGRect playerSignImageFrameNormal =   {{51,  79}, {64, 64}};
const CGRect playerSignImageFrameHigh =     {{51,  59}, {64, 64}};
const CGRect playerSignImageFrameLow =      {{51,  102}, {64, 64}};

const CGRect computerSignImageFrameNormal = {{204,  79}, {64, 64}};
const CGRect computerSignImageFrameHigh =   {{204,  59}, {64, 64}};
const CGRect computerSignImageFrameLow =    {{204,  102}, {64, 64}};

const CGFloat animationSpeed = 0.2;

@interface GameViewController()

@property (weak, nonatomic) IBOutlet UIImageView *playerSignImageView;
@property (weak, nonatomic) IBOutlet UIImageView *computerSignImageView;

@property (weak, nonatomic) IBOutlet UILabel *playerNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *computerNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *playerScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *computerScoreLabel;

@property (weak, nonatomic) IBOutlet UILabel *messageLabel;

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *signButtons;

- (IBAction)quitButtonPressed:(id)sender;
- (IBAction)signButtonPressed:(UIButton *)sender;

- (void)updateScore;
- (void)setAlSignButtonEnable:(BOOL)enable;
- (void)animateSignsWithCount:(NSInteger)count playerSign:(HandSign *)playerSign computerSign:(HandSign *)computerSign;

@end

@implementation GameViewController

@synthesize playerSignImageView = _playerSignImageView;
@synthesize computerSignImageView = _computerSignImageView;
@synthesize playerNameLabel = _playerNameLabel;
@synthesize computerNameLabel = _computerNameLabel;
@synthesize playerScoreLabel = _playerScoreLabel;
@synthesize computerScoreLabel = _computerScoreLabel;
@synthesize messageLabel = _messageLabel;
@synthesize signButtons = _signButtons;
@synthesize gameController = _gameController;

#pragma mark - local methods

- (void)updateScore
{
    [self.playerScoreLabel setText:[NSString stringWithFormat:@"%d", self.gameController.player.score]];
    [self.computerScoreLabel setText:[NSString stringWithFormat:@"%d", self.gameController.computer.score]];
}

- (void)setAlSignButtonEnable:(BOOL)enable
{
    for(UIButton *button in self.signButtons)
    {
        [button setEnabled:enable];
    }
}

- (void)animateSignsWithCount:(NSInteger)count playerSign:(HandSign *)playerSign computerSign:(HandSign *)computerSign
{
    //Animate from normal to high
    [UIView animateWithDuration:animationSpeed delay:0.0 options:UIViewAnimationCurveEaseOut animations:^
     {
         [self.playerSignImageView setFrame:playerSignImageFrameHigh];
         [self.computerSignImageView setFrame:computerSignImageFrameHigh];
     }
     completion:^(BOOL finished)
     {
        
         //Animate from high to low
         [UIView animateWithDuration:animationSpeed delay:0.0 options:UIViewAnimationCurveEaseOut animations:^
          {
              if(count <= 0)
              {
                  //setimage
                  [self.playerSignImageView setImage:[playerSign image]];
                  [self.computerSignImageView setImage:[computerSign image]];
              }
              
              [self.playerSignImageView setFrame:playerSignImageFrameLow];
              [self.computerSignImageView setFrame:computerSignImageFrameLow];
          }
          completion:^(BOOL finished)
          {
              
              //Animate from low to normal
              [UIView animateWithDuration:animationSpeed delay:0.0 options:UIViewAnimationCurveEaseOut animations:^
               {
                   [self.playerSignImageView setFrame:playerSignImageFrameNormal];
                   [self.computerSignImageView setFrame:computerSignImageFrameNormal];
               }
               completion:^(BOOL finished)
               {
                   if(count > 0)
                   {
                       [self animateSignsWithCount:count-1 playerSign:playerSign computerSign:computerSign];
                   }
                   else
                   {   
                       //results
                       SignResult signResult = [SignHelper signResultForPlayerSign:playerSign andComputerSign:computerSign];
                       
                       NSString *message = @"No winners";
                       
                       if(signResult == PLAYER_WON)
                       {
                           [self.gameController.player addPointToScore];
                           message = [SignHelper messageForWinner:playerSign andLoser:computerSign];
                       }
                       else if(signResult == PLAYER_LOSE)
                       {
                           [self.gameController.computer addPointToScore];
                           message = [SignHelper messageForWinner:computerSign andLoser:playerSign];
                       }
                       
                       [self.messageLabel setText:message];
                       
                       [self updateScore];
                       
                       //enable buttons for new round
                       [self setAlSignButtonEnable:YES];
                   }
               }];
          }];
         
     }];
}

#pragma mark - view

- (void)viewDidLoad
{
    [self.playerNameLabel setText:self.gameController.player.name];
    [self.computerNameLabel setText:self.gameController.computer.name];
    
    if(self.gameController.gameType == GAME_NORMAL)
    {
        [[self.view viewWithTag:4] setHidden:YES];
        [[self.view viewWithTag:5] setHidden:YES];
    }
    
    //flip player side:
    [self.computerSignImageView setTransform:CGAffineTransformMakeScale(-1, 1)];
}

- (void)viewDidUnload
{
    [self setPlayerSignImageView:nil];
    [self setComputerSignImageView:nil];
    [self setPlayerNameLabel:nil];
    [self setComputerNameLabel:nil];
    [self setPlayerScoreLabel:nil];
    [self setComputerScoreLabel:nil];
    [self setSignButtons:nil];
    [self setMessageLabel:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Actions

- (IBAction)quitButtonPressed:(id)sender 
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)signButtonPressed:(UIButton *)sender 
{
    [self setAlSignButtonEnable:NO];
    
    HandSign *playerSign;
    
    switch (sender.tag) 
    {
        case 1: //Rock
            playerSign = [HandSignFactory createRockSign];
            break;
        case 2: //Paper
            playerSign = [HandSignFactory createPaperSign];
            break;
        case 3: //Scissors
            playerSign = [HandSignFactory createScissorsSign];
            break;
        case 4: //Lizard
            playerSign = [HandSignFactory createLizardSign];
            break;
        case 5: //Spock
            playerSign = [HandSignFactory createSpockSign];
            break;
        default: //?
        {
            return;
            break;
        }
    }
    
    //reset image
    [self.playerSignImageView setImage:[UIImage imageNamed:@"rock.png"]];
    [self.computerSignImageView setImage:[UIImage imageNamed:@"rock.png"]];
    
    HandSign *computerSign = [self.gameController.computer getHandsignWithPlayerSign:playerSign andPossibleSigns:self.gameController.possibleSigns];
    
    //animate
    [self animateSignsWithCount:3 playerSign:playerSign computerSign:computerSign];
}

@end
