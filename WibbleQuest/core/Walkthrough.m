//
//  Walkthrough.m
//  WibbleQuest
//
//  Created by orta therox on 18/08/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import "Walkthrough.h"
#import "KIFScenario-Helpers.h"

@implementation Walkthrough

// The walkthrough uses WibbleQuests Testing suite
// to allow you to watch the game being ran and to look
// over the results, saves a lot of keybindings.

// to use it you must have the KIF files, if this isn't the case
// you need to use the terminal command "git submodule init; git submodule update"
// from inside the main directory. 

// Also you have to enable the Accessability Inspector, it's a beautiful popup,
// to do that go to Settings -> Accessability and toggle it on. If it's closed, it doesn't
// really get in the way that much.

- (void)initializeScenarios {
  // generic setup
  KIFTestScenario *game = [KIFTestScenario scenarioWithDescription:@"Walking through Game."];
  [game addStep:[KIFTestStep stepToWaitForTappableViewWithAccessibilityLabel:@"Text Input"]];
  
  //now comes your code
  [game runCommand:@"north"];
  [game runCommand:@"say hello"];
  [game runCommand:@"say keytar"];
  [game runCommand:@"west"];
  [game runCommand:@"get keytar"];
  [game checkInventoryHas:@"keytar"];
  [game runCommand:@"east"];
  [game runCommand:@"east"];
  [game runCommand:@"say hi"];
  [game runCommand:@"say mics"];
  [game checkInventoryHas:@"microphone"];
  [game runCommand:@"south"];
  [game runCommand:@"fight"];
  [game runCommand:@"fight"];  
  [game runCommand:@"fight"];  
  [game runCommand:@"fight"];
  [game runCommand:@"west"];
  [self addScenario:game];
}

@end
