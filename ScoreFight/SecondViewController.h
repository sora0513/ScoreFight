//
//  SecondViewController.h
//  ScoreFight
//
//  Created by Takafumi Kawano on 3/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController <UITextFieldDelegate>
{
    UILabel *_scoreLabel;
    UITextView *_timeLabel;
    UIButton *_pushButton;
    UIButton *_restartButton;
    UITextField *_userName;
    
    int score;
    int countDown;
    NSTimer *timer;    
}

- (IBAction)countUp:(id)sender;
- (IBAction)restart:(id)sender;

@property (retain, nonatomic) IBOutlet UILabel *scoreLabel;
@property (retain, nonatomic) IBOutlet UITextView *timeLabel;
@property (retain, nonatomic) IBOutlet UITextField *userName;
@property (retain, nonatomic) IBOutlet UIButton *pushButton;
@property (retain, nonatomic) IBOutlet UIButton *restartButton;

@end
