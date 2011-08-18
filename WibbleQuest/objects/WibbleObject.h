//
//  Object.h
//  WibbleQuest
//
//  Created by orta therox on 18/07/2011.
//  Copyright 2011 http://ortatherox.com. Licensed under Creative Commons
//

#import <Foundation/Foundation.h>

@interface WibbleObject : NSObject {
  NSMutableDictionary * _helpList;
  NSMutableDictionary * _commandResponses;
}

// if no id is set, it will try to use a lowercase name without spaces, 
// if no name is used it will use the lowerclass class name for the id
@property (retain, nonatomic) NSString* id;
@property (retain, nonatomic) NSString* description;
@property (retain, nonatomic) NSString* name;

// Let any subclass of WibbleObject respond to commands from the User.
-(BOOL)didRespondToCommand:(NSArray*)commandArray;
// Or use a block to do simpler string checks
-(void)respondTo:(NSString *) command with:(void (^) (void)) block;

// A method that gets called at an interval specified by the shared wibble
-(void)tick;

-(BOOL)_respond:(NSString *)commands;

// Methods for the dynamic help system
// Print help will only be called if it is in the current room or in the inventory.
-(void)addCommandToHelp:(NSString*)command withDescription:(NSString*)description;
-(void)removeCommandFromHelp:(NSString*)command;

-(void)printHelp;

@end
