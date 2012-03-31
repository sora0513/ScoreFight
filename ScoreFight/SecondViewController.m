//
//  SecondViewController.m
//  ScoreFight
//
//  Created by Takafumi Kawano on 3/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SecondViewController.h"

#import <Parse/Parse.h>

#define TOTAL_SEC_TIME  10

@interface SecondViewController ()

@end

@implementation SecondViewController
@synthesize scoreLabel = _scoreLabel;
@synthesize timeLabel = _timeLabel;
@synthesize userName = _userName;
@synthesize pushButton = _pushButton;
@synthesize restartButton = _restartButton;

#pragma mark - user function

- (IBAction)countUp:(id)sender;
{
    if (!timer) {
        timer = [NSTimer scheduledTimerWithTimeInterval:(1.0) 
                                                 target:self 
                                               selector:@selector(startTimer)
                                               userInfo:nil
                                                repeats:YES];    
    }
    score += 1;
    self.timeLabel.text = [NSString stringWithFormat:@"%d", score];
}

- (IBAction)restart:(id)sender;
{
    score = 0;    
    countDown = 0;
    self.timeLabel.text = [NSString stringWithFormat:@"%d", score];
    self.scoreLabel.text = [NSString stringWithFormat:@"%d", TOTAL_SEC_TIME];
    self.pushButton.enabled = YES;
    self.restartButton.enabled = NO;
}

- (void)startTimer
{
    countDown += 1;
    int now = TOTAL_SEC_TIME - countDown;
    self.scoreLabel.text = [NSString stringWithFormat:@"%d", now];
    if (now == 0) {
        self.pushButton.enabled = NO;
        self.restartButton.enabled = YES;
        if (timer) {
            if ([timer isValid]) {
                [timer invalidate];
            }
            timer = nil;
        }

        // parse に保存する（非同期ではない）
        PFObject *gameScore = [PFObject objectWithClassName:@"GameScore"];        
        [gameScore setObject:[NSNumber numberWithInt:score] forKey:@"score"];
        [gameScore setObject:self.userName.text forKey:@"playerName"];
        [gameScore save];        
    }
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Second", @"Second");
        self.tabBarItem.image = [UIImage imageNamed:@"second"];
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];

    [self restart:nil];
    [self.userName becomeFirstResponder];
    self.userName.delegate = self;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)dealloc {
    [super dealloc];
}

- (BOOL)textFieldShouldReturn:(UITextField*)textField {
    [self.userName resignFirstResponder];
    return YES;
}

@end
