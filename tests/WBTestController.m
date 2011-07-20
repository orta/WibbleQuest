//
//  WBTestController.m
//  WibbleQuest
//
//  Created by orta therox on 19/07/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import "WBTestController.h"
#import "RoomAPI.h"
#import "SettingsTests.h"

@implementation WBTestController

- (void)initializeScenarios{
  [self addScenario:[KIFTestScenario testRoomAPI]];
}

@end
