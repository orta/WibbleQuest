//
//  InventoryTests.m
//  WibbleQuest
//
//  Created by orta therox on 21/07/2011.
//  Copyright 2011 http://ortatherox.com. Licensed under Creative Commons
//

#import "InventoryTests.h"
#import "KIFTestStep.h"
#import "KIFTestScenario-RunCommand.h"

@implementation KIFTestScenario (InventoryTests)

+ (id)inventoryAPITests {

  WibbleQuest * wq = [WibbleQuest sharedWibble];

  KIFTestScenario *scenario = [KIFTestScenario scenarioWithDescription:@"Testing Inventory Commands ."];
  [scenario addStep:[KIFTestStep stepToWaitForTappableViewWithAccessibilityLabel:@"Text Input"]];

  [scenario addStep:[KIFTestStep stepWithDescription:@"Setup" executionBlock:^(KIFTestStep *step, NSError **error) {
    
    // setup block
    WibbleQuest *wq = [WibbleQuest sharedWibble];
    
    Room * r = [[Room alloc] init];
    r.id = @"test";
    [wq addRoom:r];
    
    Item *i = [[Item alloc] init];
    i.id = @"test_item";
    [r addItem:i];
    
    wq.currentRoom = r;
    
    return KIFTestStepResultSuccess;
  }]];

  [scenario runCommand:@"get test_item"];
  [scenario addStep:[KIFTestStep stepWithDescription:@"Check get picks up an item" executionBlock:^(KIFTestStep *step, NSError **error) {

    if([wq.inventory hasItem:@"test_item"]){
      return KIFTestStepResultSuccess;
    }
    return KIFTestStepResultFailure;
    
  }]];
  
  [scenario addStep:[KIFTestStep stepWithDescription:@"Check room loses item" executionBlock:^(KIFTestStep *step, NSError **error) {
    
    if([wq.currentRoom hasItem:@"test_item"]){
      return KIFTestStepResultFailure;
    }
    return KIFTestStepResultSuccess;
    
  }]];
  

  [scenario runCommand:@"drop test_item"];
  [scenario addStep:[KIFTestStep stepWithDescription:@"Check drop drops an item" executionBlock:^(KIFTestStep *step, NSError **error) {
    
    if([wq.inventory hasItem:@"test_item"]){
      return KIFTestStepResultFailure;
    }
    return KIFTestStepResultSuccess;
    
  }]];

  [scenario addStep:[KIFTestStep stepWithDescription:@"Check room gains item" executionBlock:^(KIFTestStep *step, NSError **error) {
    
    if([wq.currentRoom hasItem:@"test_item"]){
      return KIFTestStepResultSuccess;
    }
    return KIFTestStepResultFailure;
    
  }]];
  

  
  return scenario;
}


@end
