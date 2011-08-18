//
//  KIFTestScenario-NiceThings.h
//  WibbleQuest
//
//  Created by orta therox on 17/08/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import "KIFTestScenario.h"

@interface KIFTestScenario (KIFTestScenario_NiceThings)

-(void)checkLastThingSaidWas:(NSString *)string because:(NSString*) because;
-(void)checkLastThingSaidWasnt:(NSString *)string because:(NSString*) because;
-(void)checkInt:(NSString*) because block:(int (^)()) block;
-(void)checkBool:(NSString*) because block:(BOOL (^)()) block;

@end
