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

// to use it you must have KIF installed.

- (void)initializeScenarios {
  // generic setup
  KIFTestScenario *scenario = [KIFTestScenario scenarioWithDescription:@"Walking through Game."];
  [scenario addStep:[KIFTestStep stepToWaitForTappableViewWithAccessibilityLabel:@"Text Input"]];
  
  //now comes your code
  [scenario runCommand:@"north"];
  [scenario runCommand:@"say hello"];
  [scenario runCommand:@"say keytar"];
  [scenario runCommand:@"west"];
  [scenario runCommand:@"get keytar"];

  [self addScenario:scenario];
}

@end
