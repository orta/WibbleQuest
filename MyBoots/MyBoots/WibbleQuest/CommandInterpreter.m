//
//  CommandInterpreter.m
//  MyBoots
//
//  Created by orta therox on 10/07/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import "CommandInterpreter.h"

//private methods
@interface CommandInterpreter()
-(void) getCommand:(NSArray *) params;
-(void) help;
-(void) north;
-(void) west;
-(void) east;
-(void) south;
@end


@implementation CommandInterpreter
@synthesize wq;

-(void)parse:(NSString*) string {
  string = [string lowercaseString];
  NSArray * parameters = [string componentsSeparatedByString:@" "];
  if ([parameters count] > 0) {
    NSString * command = [parameters objectAtIndex:0];
    
    if([@"help" isEqualToString:command]){
      [self help];
      return;
    }
    
    if([@"north" isEqualToString:command] || [@"n" isEqualToString:command]){
      [self north];
    }
    
    if([@"west" isEqualToString:command] || [@"w" isEqualToString:command]){
      [self west];
    }
    
    if([@"east" isEqualToString:command] || [@"e" isEqualToString:command]){
      [self east];
    }

    if([@"south" isEqualToString:command] || [@"s" isEqualToString:command]){
      [self south];
    }
    
    if([@"look" isEqualToString:command] || [@"l" isEqualToString:command]){
      [wq describeSurroundings];
      return;
    }
    
    if([@"inventory" isEqualToString:command] || [@"i" isEqualToString:command]){
      [wq.inventory describeInventory];
      return;
    }
    
    if([wq.inventory respondToCommand:parameters]) {
      return;
    }
    
    if([@"get" isEqualToString:command] || [@"g" isEqualToString:command]){
      [self getCommand:parameters];
      return;
    }
    
    [wq print:@"Command not recognised"];
  }
}

-(void) north{
  if (wq.currentRoom.north) {
    wq.currentRoom = wq.currentRoom.north;
    [wq describeSurroundings];
    return;
  }else{
    [wq print:@"There is nothing to the north."];
    return;
  }
}
-(void)west{
  if (wq.currentRoom.west) {
    wq.currentRoom = wq.currentRoom.west;
    [wq describeSurroundings];
    return;
  }else{
    [wq print:@"There is nothing to the west."];
    return;
  }
}
-(void)east{
  if (wq.currentRoom.east) {
    wq.currentRoom = wq.currentRoom.east;
    [wq describeSurroundings];
    return;
  }else{
    [wq print:@"There is nothing to the east."];
    return;
  }

}
-(void)south{
  if (wq.currentRoom.south) {
    wq.currentRoom = wq.currentRoom.south;
    [wq describeSurroundings];
    return;
  }else{
    [wq print:@"There is nothing to the south."];
    return;
  }
}

-(void)help {
  if([wq.game respondsToSelector:@selector(help)]){
    [wq.game help];
    
  }else{
    [wq title:@"Help File"];
    
    [wq print:@"Directions: type in north, east, south or west to move."];
    [wq print:@""];    
  }
}

-(void)getCommand:(NSArray *) params {
  if( [params count] == 1){
    [wq print:@"Get what?"];
  }else{
    NSString *objectID = [params objectAtIndex:1];
    if([@"all" isEqualToString:objectID]){
      [wq command:@"all is not yet implemented."];
      return;
    }
    
    if([wq.currentRoom hasItem:objectID]){
      Item* item = [wq.currentRoom getItem:objectID];
      [wq.inventory addItem:item];
      [item onPickup];
      
    }else{
      [wq print:@"Could not find a %@ in the room" , objectID];
    }
  }  
}

@end
