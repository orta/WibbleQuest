//
//  MainViewController.h
//  WibbleQuest
//
//  Created by orta therox on 09/07/2011.
//  Copyright 2011 http://ortatherox.com. Licensed under Creative Commons
//

#import "SettingsViewController.h"

@class WibbleQuest;
@interface GameViewController : UIViewController <SettingsViewControllerDelegate> {

  IBOutlet WibbleQuest *wq;
}

@property (strong, nonatomic) UIPopoverController *flipsidePopoverController;

+ (GameViewController *)viewController;
- (IBAction)showInfo:(id)sender;

@end
