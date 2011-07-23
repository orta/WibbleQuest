//
//  ShopTests.m
//  WibbleQuest
//
//  Created by orta therox on 23/07/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import "ShopTests.h"
#import "KIFTestStep.h"
#import "KIFTestScenario-Helpers.h"
#import "RockShop.h"

@implementation KIFTestScenario (ShopTests)

+ (id)shopTests {
  WibbleQuest * wq = [WibbleQuest sharedWibble];

  KIFTestScenario *scenario = [KIFTestScenario scenarioWithDescription:@"Testing Shop Commands ."];
  [scenario addStep:[KIFTestStep stepToWaitForTappableViewWithAccessibilityLabel:@"Text Input"]];

  [scenario addStep:[KIFTestStep stepWithDescription:@"Setup" executionBlock:^(KIFTestStep *step, NSError **error) {
    
    // setup block
    WibbleQuest *wq = [WibbleQuest sharedWibble];
    [wq purge];
    
    Room * r = [[Room alloc] init];
    r.id = @"test";
    [wq addRoom:r];
    
    RockShop *shop = [[RockShop alloc] init];
    shop.description = @"1234 shop";
    r.shop = shop;
    
        
    wq.currentRoom = r;
    
    return KIFTestStepResultSuccess;
  }]];

  [scenario runCommand:@"shop"];
  [scenario addStep:[KIFTestStep stepWithDescription:@"command shop lists items" executionBlock:^(KIFTestStep *step, NSError **error) {
    
    if([@"1234 shop" isEqualToString: wq.lastPrinted]){
      return KIFTestStepResultSuccess;
    }
    return KIFTestStepResultFailure;
    
  }]];
  return scenario;
}


@end
