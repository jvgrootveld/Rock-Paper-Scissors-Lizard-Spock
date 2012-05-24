//
//  ViewController.m
//  RockPaperScissors
//
//  Created by Justin van Grootveld on 5/22/12.
//  Copyright (c) 2012 Pro4all. All rights reserved.
//

#import "MenuViewController.h"
#import "GameViewController.h"
#import "Player.h"
#import "ComputerPlayer.h"
#import "GameController.h"

@interface MenuViewController()

@property (weak, nonatomic) IBOutlet UITextField *nameField;

@property (weak, nonatomic) IBOutlet UIButton *normalButton;
@property (weak, nonatomic) IBOutlet UIButton *LSButton;

@property (weak, nonatomic) IBOutlet UISegmentedControl *difficultyControl;

- (IBAction)nameFieldEditingChanged:(UITextField *)sender;

@end

@implementation MenuViewController
@synthesize nameField = _nameField;
@synthesize normalButton = _normalButton;
@synthesize LSButton = _LSButton;
@synthesize difficultyControl = _difficultyControl;

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [self setNormalButton:nil];
    [self setLSButton:nil];
    [self setNameField:nil];
    [self setDifficultyControl:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"rulesSegue"])
        return;
    
    NSString *playerName = self.nameField.text;
    
    Player *newPlayer = [Player createWithName:playerName];
    ComputerPlayer *newComputer;
    
    switch (self.difficultyControl.selectedSegmentIndex) 
    {
        case 0:
        {
            newComputer = [ComputerPlayer createEasyComputer];
            break;
        }
        case 1:
        {
            newComputer = [ComputerPlayer createMediumComputer];
            break;
        }
        case 2:
        {
            newComputer = [ComputerPlayer createHardComputer];
            break;
        }
    }
    
    GameController *gameController;
    
    //handle normal or Lizard spock
    if([segue.identifier isEqualToString:@"NormalButtonSegue"])
    {
        gameController = [GameController createNormalGameWithPlayer:newPlayer andComputerPlayer:newComputer];
    }
    else if([segue.identifier isEqualToString:@"LSButtonSegue"])
    {
        gameController = [GameController createLSGameWithPlayer:newPlayer andComputerPlayer:newComputer];
    }
    
    GameViewController *gameViewController = segue.destinationViewController;
    
    [gameViewController setGameController:gameController];
}

#pragma mark - ;

- (IBAction)nameFieldEditingChanged:(UITextField *)sender 
{
    BOOL isValidName = ![sender.text isEqualToString:@""];
    
    [self.normalButton setEnabled:isValidName];
    [self.LSButton setEnabled:isValidName];
}

#pragma mark - UITextField delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}

@end
