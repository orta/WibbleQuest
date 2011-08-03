//
//  CreatureTests.m
//  WibbleQuest
//
//  Created by Michael Jaoudi on 7/31/11.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import "CreatureTests.h"
#import "ShopTests.h"
#import "KIFTestStep.h"
#import "RockShop.h"
#import "KIFScenario-Helpers.h"
#import "KidB.h"

@implementation KIFTestScenario (ShopTests)

+ (id)creatureTests{
  WibbleQuest * wq = [WibbleQuest sharedWibble];
  
  KIFTestScenario *scenario = [KIFTestScenario scenarioWithDescription:@"Testing that you can fight an enemy"];
  [scenario addStep:[KIFTestStep stepToWaitForTappableViewWithAccessibilityLabel:@"Text Input"]];

  [scenario addStep:[KIFTestStep stepWithDescription:@"setup rooms" executionBlock:^(KIFTestStep *step, NSError **error) {
    
    // setup block
    
    Room * r = [[Room alloc] init];
    r.id = @"test";
    
    KidB *kb = [[KidB  alloc] init];
    r.encounter=kb;
    
    wq.currentRoom = r;
    
    return KIFTestStepResultSuccess;
  }]];
  
  return scenario;
}


@end
