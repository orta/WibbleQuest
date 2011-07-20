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


@implementation KIFTestScenario (RoomAPI)

+ (id)testRoomAPI {
  
  KIFTestScenario *scenario = [KIFTestScenario scenarioWithDescription:@"Testing that you can go north."];
  [scenario addStep:[KIFTestStep stepToWaitForTappableViewWithAccessibilityLabel:@"Text Input"]];
  [scenario addStep:[KIFTestStep stepToEnterText:@"north" intoViewWithAccessibilityLabel:@"Text Input"]];  
  return scenario;
}

@end
