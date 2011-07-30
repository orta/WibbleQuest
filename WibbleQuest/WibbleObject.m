//
//  Object.m
//  WibbleQuest
//
//  Created by orta therox on 18/07/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import "WibbleObject.h"

@implementation WibbleObject

@synthesize name, id, description;

-(BOOL)didRespondToCommand:(NSArray*)commandArray {
  return NO;
}


@end
