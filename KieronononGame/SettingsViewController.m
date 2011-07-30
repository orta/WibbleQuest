//
//  SettingsViewController.m
//  WibbleQuest
//
//  Created by orta therox on 09/07/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import "SettingsViewController.h"

@implementation SettingsViewController

@synthesize hideTextFieldSwitch = _hideTextFieldSwitch;
@synthesize delegate = _delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.contentSizeForViewInPopover = CGSizeMake(320.0, 480.0);
    }
    return self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
  
  self.hideTextFieldSwitch.on = [[NSUserDefaults standardUserDefaults] boolForKey:@"hideTextFieldAfterCommand"];
}

- (void)viewDidUnload {
  [self setHideTextFieldSwitch:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
  
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
  if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
      return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
  } else {
      return YES;
  }
}

#pragma mark - Actions

- (IBAction)done:(id)sender
{
    [self.delegate SettingsViewControllerDidFinish:self];
}
-(IBAction)hideTextfieldAfterCommand:(id)sender{  
  UISwitch * switchClass = (UISwitch*)sender;
  
  [[NSUserDefaults standardUserDefaults] setBool: [switchClass isOn] forKey:@"hideTextFieldAfterCommand"];
  [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)dealloc {
  [_hideTextFieldSwitch release];
  [super dealloc];
}
@end
