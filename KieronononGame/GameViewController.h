//
//  MainViewController.h
//  WibbleQuest
//
//  Created by orta therox on 09/07/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import "SettingsViewController.h"

@class WibbleQuest;
@interface GameViewController : UIViewController <SettingsViewControllerDelegate> {

  IBOutlet WibbleQuest *wq;
}

@property (retain, nonatomic) UIPopoverController *flipsidePopoverController;


- (IBAction)showInfo:(id)sender;

@end
