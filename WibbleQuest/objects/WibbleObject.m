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

-(NSString *) id {
  if(_id) return _id;
  if(self.name) return [[self.name lowercaseString] stringByReplacingOccurrencesOfString:@" " withString:@""];
  return [NSStringFromClass([self class]) lowercaseString];
}

-(void) setId:(NSString *)id {
  [_id release];
  id = [id lowercaseString];
  _id = [id retain];
}

#pragma mark Deal with Responding to commands

-(BOOL)_respond:(NSString *)commands {
  if( [self didRespondToCommand:[commands componentsSeparatedByString:@" "]] ){
    return YES;
  }
  for (NSString * key in _commandResponses) {
    if ([commands hasPrefix:key]) {
      void(^command)(void) = [_commandResponses objectForKey:key];
      command();
      return YES;
    }
  }
  return NO;
}

-(BOOL)didRespondToCommand:(NSArray*)commandArray {
  return NO;
}

-(void)respondTo:(NSString *) command with:(void (^) (void)) block{
  if(_commandResponses == nil){
    _commandResponses = [[NSMutableDictionary alloc] initWithCapacity:1];
  }
  [_commandResponses setObject:block forKey:command];
}

#pragma mark Help
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

#pragma mark Tick over time
-(void)tick{}

@end
