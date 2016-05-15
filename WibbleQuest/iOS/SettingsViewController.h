//
//  SettingsViewController.h
//  WibbleQuest
//
//  Created by orta therox on 09/07/2011.
//  Copyright 2011 http://ortatherox.com. Licensed under Creative Commons
//

#import <UIKit/UIKit.h>

@class SettingsViewController;

@protocol SettingsViewControllerDelegate
- (void)SettingsViewControllerDidFinish:(SettingsViewController *)controller;
@end

@interface SettingsViewController : UIViewController {
  UISwitch *_hideTextFieldSwitch;
  UISwitch *_showLookSwitch;

}

@property (nonatomic, strong) IBOutlet UISwitch *hideTextFieldSwitch;
@property (nonatomic, strong) IBOutlet UISwitch *showLookSwitch;

@property (strong, nonatomic) IBOutlet id <SettingsViewControllerDelegate> delegate;

- (IBAction)done:(id)sender;
- (IBAction)hideTextfieldAfterCommand:(id)sender;
- (IBAction)showDescriptionOnRoomChange:(id)sender;

@end
