//
//  WibbleQuestViewHandlingCategory.h
//  WibbleQuest
//
//  Created by orta therox on 09/07/2011.
//  Copyright 2011 http://ortatherox.com. Licensed under Creative Commons
//

// see WibbleQuestViewHandlingCategory.m for more info

#import "WibbleQuest.h"

@interface WibbleQuest (WibbleQuestViewHandlingCategory) 
  -(void)rotatedToUInterfaceIdiom:(UIInterfaceOrientation) orientation;
  -(void) setupGestureRecognisers;
  -(float)distanceForMovement;
@end
