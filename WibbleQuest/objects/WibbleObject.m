//
//  Object.m
//  WibbleQuest
//
//  Created by orta therox on 18/07/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import "WibbleObject.h"

@implementation WibbleObject

@synthesize name, description, id = _id;

-(void) setId:(NSString *)id {
  [_id release];
  id = [id lowercaseString];
  _id = [id retain];
}

-(BOOL)didRespondToCommand:(NSArray*)commandArray {
  return NO;
}

-(void)tick{}

@end
