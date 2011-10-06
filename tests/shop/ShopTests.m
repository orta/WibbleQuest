//
//  ShopTests.m
//  WibbleQuest
//
//  Created by orta therox on 23/07/2011.
//  Copyright 2011 http://ortatherox.com. Licensed under Creative Commons
//

#import "ShopTests.h"
#import "KIFTestStep.h"
#import "KIFScenario-Helpers.h"

@implementation KIFTestScenario (ShopTests)

+ (id)shopTests {
  KIFTestScenario *scenario = [KIFTestScenario scenarioWithDescription:@"Testing Shop Commands ."];
  [scenario addStep:[KIFTestStep stepToWaitForTappableViewWithAccessibilityLabel:@"Text Input"]];

  [scenario addStep:[KIFTestStep stepWithDescription:@"Setup" executionBlock:^(KIFTestStep *step, NSError **error) {
    
    // setup block
    WibbleQuest *wq = [WibbleQuest sharedWibble];
    [wq purge];
    
    Player* p = [Player sharedPlayer];
    p.money = 20;
    
    Room * r = [[Room alloc] init];
    r.id = @"test";
    [wq addRoom:r];
    
    Store *shop = [[Store alloc] init];
    shop.description = @"1234 shop";
    [shop addItemOfClass: [Item class] withValue:10];

    r.store = shop;
        
    wq.currentRoom = r;
    
    return KIFTestStepResultSuccess;
  }]];

  [scenario runCommand:@"shop"];
  [scenario checkLastThingSaidWas:@"Item - £10" because:@"testing shop command lists items in shop"];
  
  [scenario checkInt:@"player has £20"  block:^{
    Player * player = [Player sharedPlayer];
    return player.money == 20;
  }];
  
  [scenario runCommand:@"buy item"];

  [scenario checkInt:@"player has £10"  block:^{
    Player * player = [Player sharedPlayer];
    return player.money == 10;
  }];
  
  [scenario checkBool:@"player has the Item"  block:^{
    return [Inventory hasItem:@"item"];
  }];

  
  
  return scenario;
}
@end
