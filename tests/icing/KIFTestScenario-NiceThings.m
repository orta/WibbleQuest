//
//  KIFTestScenario-NiceThings.m
//  WibbleQuest
//
//  Created by orta therox on 17/08/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import "KIFTestScenario-NiceThings.h"
#import "KIFTestStep.h"

@implementation KIFTestScenario (KIFTestScenario_NiceThings)

-(void)checkLastThingSaidWas:(NSString *)string because:(NSString*) because {
  [self addStep:[KIFTestStep stepWithDescription: because executionBlock:^(KIFTestStep *step, NSError **error) {
    if ( [[WibbleQuest sharedWibble].lastPrinted isEqualToString:string]) {
      return KIFTestStepResultSuccess;
    }
    KIFTestCondition(FALSE, error, because);
    return KIFTestStepResultFailure;
  }]];
}

@end
