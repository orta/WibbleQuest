//
//  ExitRoom.m
//  Megatron
//
//  Created by orta therox on 28/07/2011.
//  Copyright 2011 http://ortatherox.com. Licensed under Creative Commons
//

#import "ExitRoom.h"

@implementation ExitRoom

-(void)playerDidEnterRoom {
  if ([Player sharedPlayer].money == 2) {
    [WQ heading:@"It's over"];
    [WQ print:@"You have the the kids grabbed and are ready to go, it got prety stressful at one point, but you made it through it pretty well. Good work ole chap"];
    
    [WQ wait:3];
    [WQ print:@"Happy Secret Santa Megatron, ./orta"];
    [WQ print:@"http://orta.github.com"];
    [WQ wait: 6];
    WibbleQuest *wq = [WibbleQuest sharedWibble];
    [wq restart];
  }
  
}

@end
