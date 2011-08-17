//
//  KIFTestScenario-RoomCommands.m
//  WibbleQuest
//
//  Created by orta therox on 19/07/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import "KIFTestScenario-RoomCommands.h"
#import "KIFTestStep.h"

@implementation KIFTestScenario (KIFTestScenario_RoomCommands)

-(void)checkRoomIsID:(NSString *)string because:(NSString*) because{
  [self addStep:[KIFTestStep stepWithDescription: because executionBlock:^(KIFTestStep *step, NSError **error) {
    BOOL successfulReset = NO;
    if ([WibbleQuest sharedWibble].currentRoom == [Room getRoomByID:string]) {
      successfulReset = YES;
    }
    if(successfulReset == NO){
      NSLog(@"room.id = %@", [WibbleQuest sharedWibble].currentRoom.id);
    }

    KIFTestCondition(successfulReset, error, @"Failed to move to room correctly.");
    return KIFTestStepResultSuccess;
  }]];
}

@end
