//
//  CommandInterpreter.m
//  MyBoots
//
//  Created by orta therox on 10/07/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import "CommandInterpreter.h"
#import "PlayerInventory.h"

//private methods
@interface CommandInterpreter()
-(void) getCommand:(NSArray *) params;
-(void) help;
-(void) north;
-(void) west;
-(void) east;
-(void) south;
-(void)moveToRoom:(Room*)newRoom;
-(NSArray *)removeQuestionMarks:(NSArray*)array;
@end


@implementation CommandInterpreter
@synthesize wq;

-(void)parse:(NSString*) string {
  string = [string lowercaseString];
  NSArray * parameters = [string componentsSeparatedByString:@" "];
  if ([parameters count] > 0) {
    NSString * command = [parameters first];
    
    if([@"help" isEqualToString:command]){
      [self help];
      return;
    }
    
    // support 'go north'
    if ([@"go" isEqualToString:command]) {
        command = [parameters second];
        
      // support 'go to north'
        if ([@"to" isEqualToString:command]) {
          command = [parameters third]; 
        }
      }
    
    
    if([@"north" isEqualToString:command] || [@"n" isEqualToString:command]){
      [self north];
      return;
    }
    
    if([@"west" isEqualToString:command] || [@"w" isEqualToString:command]){
      [self west];
      return;
    }
    
    if([@"east" isEqualToString:command] || [@"e" isEqualToString:command]){
      [self east];
      return;
    }

    if([@"south" isEqualToString:command] || [@"s" isEqualToString:command]){
      [self south];
      return;
    }
    
    if([@"look" isEqualToString:command] || [@"l" isEqualToString:command]){
      [wq describeSurroundings];
      return;
    }
    
    if([@"inventory" isEqualToString:command] || [@"i" isEqualToString:command]){
      [wq.inventory describeInventory];
      return;
    }

    if([@"use" isEqualToString:command] || [@"u" isEqualToString:command]){
      Item *item = [wq.inventory getItem:[parameters second]];
      [item onUse];
      return;
    }

    
    if([@"examine" isEqualToString:command] || [@"x" isEqualToString:command]){
      if([parameters count] == 1){
        [wq print:@"Examine what?"];
        return;
      }

      if([@"room" isEqualToString:[parameters second]]){
        [wq describeSurroundings];
        return;
      }

      [wq.currentRoom examineWithInput:string];
      return;
    }

    
    if([@"shop" isEqualToString:command] || [@"s" isEqualToString:command]){
      [wq.currentRoom describeShop];
      return;
    }
    
    if([@"buy" isEqualToString:command]){
      [wq.currentRoom buyItem:parameters];
      return;
    }
    
    if([@"fight" isEqualToString:command] || [@"f" isEqualToString:command]||
       [@"attack" isEqualToString:command] || [@"a" isEqualToString:command]){
      if (wq.currentRoom.encounter == nil) {
        [wq print:@"There is no-one here to fight."];
        return;
      }
      [wq.currentRoom.encounter fight];
      
      return;
    }
    
    if([@"say" isEqualToString:command] || [@"s" isEqualToString:command]){
      if([parameters count] == 1){
        [wq print:@"What do you want to say?"];
        return;
      }
      
      parameters = [self removeQuestionMarks:parameters];
      if (wq.currentRoom.person) {
        [wq.currentRoom.person respondToSentenceArray:parameters];
        return;
      }
      if(wq.currentRoom.encounter){
        [wq.currentRoom.encounter respondToSentenceArray:parameters];
        return;
      }
    }

    
    
    if([wq.inventory respondToCommand:parameters]){
      return;
    }
      
    if([wq.inventory hasItem:command]){
      Item * item = [wq.inventory getItem:command];
      [wq print: item.description];
    }

    if([wq.currentRoom hasItem:command]){
      Item * item = [wq.currentRoom getItem:command];
      [wq print: item.description];
    }
    
    if([@"get" isEqualToString:command] || [@"g" isEqualToString:command]){
      [self getCommand:parameters];
      return;
    }
    
    [wq print:@"Command not recognised"];
  }
}

-(void)north {
  [self moveToRoom: wq.currentRoom.north];
}

-(void)west {
  [self moveToRoom: wq.currentRoom.west];
}

-(void)east {
  [self moveToRoom: wq.currentRoom.east];
}

-(void)south {
  [self moveToRoom: wq.currentRoom.south];
}

-(void)moveToRoom:(Room*)newRoom{
  if([wq.currentRoom playerShouldLeaveRoom] &&
     [newRoom playerShouldEnterRoom]){
    
    [wq.currentRoom playerDidLeaveRoom];
    wq.currentRoom = newRoom;
    [wq.currentRoom playerDidEnterRoom];
    [wq movedRoom];
  }
  else{
    [wq print:@"There is nothing in that direction."];   
  }
}

-(void)help {
  if([wq.game respondsToSelector:@selector(help)]){
    [wq.game help];
    
  }else{
    [wq title:@"Help File"];
    [wq command:@"most commands work with typing the first letter."];
    [wq command:@""];
    
    [wq print:@"north, east, south, west"];
    [wq command:@"move in a direction."];
    
    [wq print:@"get [item]"];
    [wq command:@"get an item from the current room."];
    
    [wq print: @"examine [item]"];
    [wq command:@"examine an item either in the room."];

    [wq print: @"look"];
    [wq command:@"look at your surroundings."];
    
    [wq print: @"inventory"];
    [wq command:@"Look at the items inside your inventory."];

    [wq print: @"fight"];
    [wq command:@"Start a fight with something hostile."];
    
    [wq print: @"say [words]"];
    [wq command:@"Talk to something or somebody."];

  }
}

// when get is called
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
      Item* item = [wq.currentRoom takeItem:objectID];
      [wq.inventory addItem:item];
      
    }else{
      [wq print:@"Could not find a %@ in the room" , objectID];
    }
  }  
}

-(NSArray *)removeQuestionMarks:(NSArray *)array{
  NSString * stringedArray = [array componentsJoinedByString:@" "];
  stringedArray = [stringedArray stringByReplacingOccurrencesOfString:@"?" withString:@""];
  return [stringedArray componentsSeparatedByString:@" "];
}

@end
