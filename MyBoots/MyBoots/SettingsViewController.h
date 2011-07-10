//
//  SettingsViewController.h
//  MyBoots
//
//  Created by orta therox on 09/07/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SettingsViewController;

@protocol SettingsViewControllerDelegate
- (void)SettingsViewControllerDidFinish:(SettingsViewController *)controller;
@end

@interface SettingsViewController : UIViewController

@property (retain, nonatomic) IBOutlet id <SettingsViewControllerDelegate> delegate;

- (IBAction)done:(id)sender;

@end
