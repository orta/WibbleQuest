//
//  WBTestController.m
//  WibbleQuest
//
//  Created by orta therox on 19/07/2011.
//  Copyright 2011 http://ortatherox.com. Licensed under Creative Commons
//

#import "WBTestController.h"
#import "RoomAPI.h"
#import "InventoryTests.h"
#import "ShopTests.h"

@implementation WBTestController

- (void)initializeScenarios{
  // [self addScenario:[KIFTestScenario shopTests]];
   [self addScenario:[KIFTestScenario testRoomAPI]];
  // [self addScenario:[KIFTestScenario inventoryAPITests]];
}

@end
