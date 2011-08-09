//
//  Object.m
//  WibbleQuest
//
//  Created by orta therox on 18/07/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import "WibbleObject.h"

@implementation WibbleObject

@synthesize name, description, id = _id, helpList;

-(void) setId:(NSString *)id {
  [_id release];
  id = [id lowercaseString];
  _id = [id retain];
}

-(BOOL)didRespondToCommand:(NSArray*)commandArray {
  return NO;
}

-(void)tick{}

-(void)addCommandToHelp:(NSString*)command withDescription:(NSString*)info{
  if(self.helpList == nil){
    self.helpList= [[NSMutableDictionary alloc] initWithCapacity:3];
  }
  [self.helpList setObject:info forKey:command];
}

-(void)printHelp{
  if ([self.helpList count] == 0 ) return;
  
  NSArray *keys=[self.helpList allKeys];
  for (int x = 0; x < [self.helpList count]; x++){
    [WQ print:[keys objectAtIndex:x]];
    [WQ command:[self.helpList objectForKey:[keys objectAtIndex:x]]];
  }
}

@end
