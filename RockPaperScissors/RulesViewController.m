//
//  HelpViewController.m
//  RockPaperScissors
//
//  Created by Justin van Grootveld on 5/24/12.
//  Copyright (c) 2012 Pro4all. All rights reserved.
//

#import "RulesViewController.h"
#import <MediaPlayer/MediaPlayer.h>

@interface RulesViewController()

@property (nonatomic, strong) MPMoviePlayerViewController *player;

- (IBAction)doneButtonPressed:(id)sender;
- (IBAction)videoButtonPressed:(id)sender;

@end

@implementation RulesViewController

@synthesize player = _player;

#pragma mark - Actions

- (IBAction)doneButtonPressed:(id)sender 
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)videoButtonPressed:(id)sender 
{
    NSString *videoURL = [[NSBundle mainBundle] pathForResource:@"rps_video" ofType:@"mov"]; 
    
    self.player = [[MPMoviePlayerViewController alloc] initWithContentURL:[NSURL fileURLWithPath:videoURL]];
    self.player.moviePlayer.fullscreen = YES;
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(moviePlayerDidExitFullscreen:)
                                                 name:MPMoviePlayerPlaybackDidFinishNotification
                                               object:self.player.moviePlayer];
    
    [self presentModalViewController:self.player animated:YES];
    
    [self.player.moviePlayer play];
}

- (void)moviePlayerDidExitFullscreen:(NSNotification *)theNotification 
{   
    [self.player dismissModalViewControllerAnimated:YES];
    [self setPlayer:nil];
}

- (void)viewDidUnload 
{
    [self setPlayer:nil];
    [super viewDidUnload];
}

@end
