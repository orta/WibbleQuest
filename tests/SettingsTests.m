//
//  SettingsTests.m
//  WibbleQuest
//
//  Created by orta therox on 19/07/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import "SettingsTests.h"

#import "KIFTestScenario+EXAdditions.h"
#import "KIFTestStep.h"
#import "KIFTestStep+EXAdditions.h"

@implementation KIFTestScenario (SettingsTests)

+ (id)testSettings {
  
  KIFTestScenario *scenario = [KIFTestScenario scenarioWithDescription:@"Testing that you can load settings."];
  [scenario addStep:[KIFTestStep stepToWaitForTappableViewWithAccessibilityLabel:@"Settings"]];

  return scenario;
}


@end
