//
//  FirstViewController.h
//  ScoreFight
//
//  Created by Takafumi Kawano on 3/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UITableViewController
{
    NSArray *_users;
}

@property (retain, nonatomic) NSArray *users;

@end
