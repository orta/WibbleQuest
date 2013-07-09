//
//  CommandInterpreter.m
//  WibbleQuest
//
//  Created by orta therox on 10/07/2011.
//  Copyright 2011 http://ortatherox.com. Licensed under Creative Commons
//

#import "CommandInterpreter.h"
#import "PlayerInventory.h"

//private methods
@interface CommandInterpreter()
-(void) getCommand:(NSArray *) params;
-(void) dropCommand:(NSArray *) params;
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

-(BOOL)parse:(NSString*) string {
  string = [string lowercaseString];
  NSArray * parameters = [string componentsSeparatedByString:@" "];
  if ([parameters count] > 0) {
    NSString * command = [parameters first];
    if ([@"" isEqualToString:command]) {
      return NO;
    }
    
    if([wq.inventory _respond:string]) return YES;
    if([wq.currentRoom _respond:string]) return YES;
    if([wq.currentRoom.person _respond:string]) return YES;
    if([wq.currentRoom.encounter _respond:string]) return YES;
    if([wq.currentRoom.store _respond:string]) return YES;
    
    if([@"help" isEqualToString:command]){
      [self help];
      return YES;
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
      return YES;
    }
    
    if([@"west" isEqualToString:command] || [@"w" isEqualToString:command]){
      [self west];
      return YES;
    }
    
    if([@"east" isEqualToString:command] || [@"e" isEqualToString:command]){
      [self east];
      return YES;
    }
    
    if([@"south" isEqualToString:command] || [@"s" isEqualToString:command]){
      [self south];
      return YES;
    }
    
    if([@"look" isEqualToString:command] || [@"l" isEqualToString:command]){
      [wq describeSurroundings];
      return YES;
    }
    
    if([@"inventory" isEqualToString:command] || [@"i" isEqualToString:command]){
      [wq.inventory describeInventory];
      return YES;
    }
    
    if([@"use" isEqualToString:command] || [@"u" isEqualToString:command]){
      Item *item = [wq.inventory getItem:[parameters second]];
      if(item){
        if(item.onInlineUse){
          [item onInlineUse]();
        }else{
          [item onUse]; 
        }
        return YES;
        
      }else{
        [wq print:@"Could not find %@ in your inventory", [parameters second]];
        return NO;
      }
    }
    
    if([@"drop" isEqualToString:command] || [@"d" isEqualToString:command]){
      [self dropCommand:parameters];
      return YES;
    }
    
    if([@"examine" isEqualToString:command] || [@"x" isEqualToString:command]){
      if([parameters count] == 1){
        [wq print:@"Examine what?"];
        return NO;
      }
      
      if([@"room" isEqualToString:[parameters second]]){
        [wq describeSurroundings];
        return YES;
      }
      
      [wq.currentRoom examineWithInput:string];
      return YES;
    }
    
    
    if([@"shop" isEqualToString:command] || [@"trade" isEqualToString:command]){
      if (wq.currentRoom.store) {
        [wq.currentRoom.store showStoreInventory];
        return YES;
      }else{
        [wq print:@"There isn't a shop here."];
        return NO;
      }
    }
    
    if([@"buy" isEqualToString:command]){
      if (wq.currentRoom.store) {
        [wq.currentRoom.store buyItem:parameters];
        return YES;
      }else{
        [wq print:@"There isn't a shop here."];
        return NO;
      }
    }
    
    if([@"money" isEqualToString:command]||[@"coins" isEqualToString:command]){
      [wq print:@"You have £%i",[Player sharedPlayer].money];
      return YES;
    }
    
    if([@"fight" isEqualToString:command] || [@"f" isEqualToString:command]||
       [@"attack" isEqualToString:command] || [@"a" isEqualToString:command]){
      if (wq.currentRoom.encounter == nil) {
        [wq print:@"There is no-one here to fight."];
        return NO;
      }
      
      [wq.currentRoom.encounter fight];
      return YES;
    }
    
    if([@"say" isEqualToString:command] || [@"ask" isEqualToString:command] || [@"talk" isEqualToString:command]){
      if([parameters count] == 1){
        [wq print:@"What do you want to say?"];
        return NO;
      }
      
      parameters = [self removeQuestionMarks:parameters];
      if (wq.currentRoom.person) {
        [wq.currentRoom.person respondToSentenceArray:parameters];
      }
      if(wq.currentRoom.encounter){
        [wq.currentRoom.encounter respondToSentenceArray:parameters];
      }
      return YES;
    }
    
    if ([@"money" isEqualToString:command]) {
      Player *player = [Player sharedPlayer];
      [wq print: [NSString stringWithFormat: @"You have %i money.", player.money]];
      return YES;
    }
    
    if([wq.inventory hasItem:command]){
      Item * item = [wq.inventory getItem:command];
      [wq print: item.description];
      return YES;
    }
    
    if([wq.currentRoom hasItem:command]){
      Item * item = [wq.currentRoom getItem:command];
      [wq print: item.description];
      return YES;
    }
    
    if([@"get" isEqualToString:command] || [@"g" isEqualToString:command]){
      [self getCommand:parameters];
      return YES;
    }
    
    if (_madeFirstMistake == NO) {
      [wq print:@"Command not understood, type <em>help</em> if you want to see the help file."];
      _madeFirstMistake = YES;
    }else{
      [wq print:@"Command not recognised"];
    }
  }
  return NO;
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
  [wq title:@"Help File"];
  [wq command:@"most commands work with typing the first letter."];
  [wq command:@""];
  
  [wq print:@"north, east, south, west"];
  [wq command:@"move in a direction."];
  
  [wq print:@"get <em>item</em>"];
  [wq command:@"get an item from the current room."];
  
  [wq print:@"drop <em>item</em>"];
  [wq command:@"drop an item into the current room."];
  
  [wq print: @"examine <em>item</em>"];
  [wq command:@"examine an item in the room."];
  
  [wq print: @"look"];
  [wq command:@"look at your surroundings."];
  
  [wq print: @"inventory"];
  [wq command:@"Look at the items inside your inventory."];
  
  [wq print: @"fight"];
  [wq command:@"Start a fight with something hostile."];
  
  [wq print: @"say <em>words</em>"];
  [wq command:@"Talk to something or somebody."];
  
  [wq print: @"shop "];
  [wq command:@"Talk to a shop owner."];
  
  [wq print: @"buy <em>item</em>"];
  [wq command:@"Buy an item from a shop."];
  
  [wq print: @"money"];
  [wq command:@"Shows how much money you have."];
  
  [wq.currentRoom printHelp];
  [wq.currentRoom.encounter printHelp];
  [wq.currentRoom.person printHelp];
  
  for (Item *i in wq.currentRoom.items){
    [i printHelp];
  }
  
  for (Item *i in wq.inventory.items) {
    [i printHelp];
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
      if([[wq.currentRoom getItem:objectID] canPickup]){
        Item* item = [wq.currentRoom takeItem:objectID];
        [wq.inventory addItem:item];
      }
      else{
        [wq print:@"You are unable to pickup %@" , objectID];
      }
      
    }else{
      [wq print:@"Could not find a %@ in the room" , objectID];
    }
  }  
}

-(void)dropCommand:(NSArray *) params {
  if( [params count] == 1){
    [wq print:@"Drop what?"];
  }else{
    NSString *objectID = [params objectAtIndex:1];
    if([@"all" isEqualToString:objectID]){
      [wq command:@"All is not yet implemented."];
      return;
    }
    
    if([Player hasItemByID:objectID]){
      Item* item = [Player getItemByID:objectID];
      if ( [item canDrop] ){
        [wq.currentRoom addItem:item];
        
        // has a block been defined?
        if(item.onInlineDrop){
          [item onInlineDrop]();
        }else{
          [item onDrop];
        }
        
        [wq.inventory removeItemByID:objectID];
      }
      else{
        [wq print:@"You are unable to drop %@" , objectID];
      }
      
    }else{
      [wq print:@"Could not find a %@ in your inventory" , objectID];
    }
  }  
}

-(NSArray *)removeQuestionMarks:(NSArray *)array{
  NSString * stringedArray = [array componentsJoinedByString:@" "];
  stringedArray = [stringedArray stringByReplacingOccurrencesOfString:@"?" withString:@""];
  return [stringedArray componentsSeparatedByString:@" "];
}

@end
