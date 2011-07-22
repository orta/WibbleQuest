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
  
  KIFTestScenario *scenario = [KIFTestScenario scenarioWithDescription:@"Testing that you can go move N E S W."];
  [scenario addStep:[KIFTestStep stepToWaitForTappableViewWithAccessibilityLabel:@"Text Input"]];
    
  [scenario addStep:[KIFTestStep stepWithDescription:@"setup rooms" executionBlock:^(KIFTestStep *step, NSError **error) {

    // setup block
    
    Room * r = [[Room alloc] init];
    r.id = @"test";
    [wq addRoom:r];
    
    Room * rNorth = [[Room alloc] init];
    rNorth.id = @"testNorth";
    [r connectNorth:rNorth];
    [wq addRoom:rNorth];
    
    Room * rWest = [[Room alloc] init];
    rWest.id = @"testWest";
    [r connectWest:rWest];
    [wq addRoom:rWest];

    wq.currentRoom = r;
  
    return KIFTestStepResultSuccess;
  }]];
  
  [scenario runCommand:@"north"];
  [scenario checkRoomIsID:@"testNorth" because:@"testing moving north"];
  
  [scenario runCommand:@"south"];
  [scenario checkRoomIsID:@"test" because:@"testing moving south"];

  [scenario runCommand:@"west"];
  [scenario checkRoomIsID:@"testWest" because:@"testing moving west"];

  [scenario runCommand:@"east"];
  [scenario checkRoomIsID:@"test" because:@"testing moving east"];

  [scenario runCommand:@"north;south"];
  [scenario checkRoomIsID:@"test" because:@"testing moving north then back south in one command"];

  [scenario addStep:[KIFTestStep stepWithDescription:@"Player teleport" executionBlock:^(KIFTestStep *step, NSError **error) {
    
    [Player teleportToRoomWithID:@"testNorth"] ;
    return KIFTestStepResultSuccess;
  }]];
  [scenario checkRoomIsID:@"testNorth" because:@"testing Player teleporting"];

  return scenario;
}

@end
