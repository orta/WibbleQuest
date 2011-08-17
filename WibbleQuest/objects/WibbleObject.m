//
//  Object.m
//  WibbleQuest
//
//  Created by orta therox on 18/07/2011.
//  Copyright 2011 http://ortatherox.com. Licensed under Creative Commons
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

-(void)addCommandToHelp:(NSString*)command withDescription:(NSString*)info{
  if(_helpList == nil){
    _helpList = [[NSMutableDictionary alloc] initWithCapacity:3];
  }
  [_helpList setObject:info forKey:command];
}

-(void)removeCommandFromHelp:(NSString*)command {
  [_helpList removeObjectForKey:command];
}

-(void)printHelp{
  if ([_helpList count] == 0 ) return;
  
  NSArray *keys=[_helpList allKeys];
  for (int x = 0; x < [_helpList count]; x++){
    [WQ print:[keys objectAtIndex:x]];
    [WQ command:[_helpList objectForKey:[keys objectAtIndex:x]]];
  }
}

@end
