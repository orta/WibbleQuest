//
//  WibbleQuestAppDelegate.m
//  WibbleQuest
//
//  Created by orta therox on 31/07/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import "WibbleQuestAppDelegate.h"
#import "MyBootsAppDelegate.h"

@implementation WibbleQuestAppDelegate

@synthesize window = _window, chameleonNSView;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification{
  chameleonApp = [[MyBootsAppDelegate alloc] init];
  [chameleonNSView launchApplicationWithDelegate:chameleonApp afterDelay:1];
}

@end
