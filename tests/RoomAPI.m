//
//  RoomAPI.m
//  WibbleQuest
//
//  Created by orta therox on 19/07/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import "RoomAPI.h"

#import "KIFTestScenario+EXAdditions.h"
#import "KIFTestStep.h"
#import "KIFTestStep+EXAdditions.h"
#import "KIFTestScenario-RunCommand.h"
#import "KIFTestScenario-RoomCommands.h"

@implementation KIFTestScenario (RoomAPI)

+ (id)testRoomAPI {
  
  WibbleQuest * wq = [WibbleQuest sharedWibble];
  
  KIFTestScenario *scenario = [KIFTestScenario scenarioWithDescription:@"Testing that you can go north."];
  [scenario addStep:[KIFTestStep stepToWaitForTappableViewWithAccessibilityLabel:@"Text Input"]];
    
  [scenario addStep:[KIFTestStep stepWithDescription:@"setup rooms" executionBlock:^(KIFTestStep *step, NSError **error) {

    // setup block
    
    Room * r = [[Room alloc] init];
    r.id = @"test";
    [wq addRoom:r];
    
    Room * rNorth = [[Room alloc] init];
    [r connectNorth:rNorth];
    rNorth.id = @"testNorth";
    [wq addRoom:rNorth];
    
    wq.currentRoom = r;
  
    return KIFTestStepResultSuccess;
  }]];
  
  [scenario runCommand:@"north"];
  [scenario checkRoomIsID:@"testNorth" because:@"testing moving north"];
  
  return scenario;
}

@end
