//
//  Bubba.m
//  MyBoots
//
//  Created by orta therox on 11/07/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import "Bubba.h"

@implementation Bubba

- (id)init {
    self = [super init];
    if (self) {
      self.descriptionInRoom = @"There is a round and massive bottle of water here, on the side is the word Bubba.";
      self.id = @"bubba";
      self.name = @"Bubba";
      drinksLeft = 3;
    }
    return self;
}

- (void) drink {
  if (drinksLeft > 0) {
    drinksLeft = drinksLeft--;
    [WQ print:@"You take a swig from your Bubba, the water is pretty refreshing"];
  }else{
    [WQ print:@"Oh.. Looks like Bubba is empty."]; 
  }
}

-(void)command:(NSArray*)commandArray {
  NSString * command = [commandArray objectAtIndex:0];
  if([@"drink" isEqualToString:command] || [@"imbibe" isEqualToString:command] || [@"consume" isEqualToString:command] ){
    [self drink];
  }
}

-(BOOL)respondsToCommand:(NSString*)command{
  if([@"drink" isEqualToString:command] || [@"imbibe" isEqualToString:command] || [@"consume" isEqualToString:command] ){
    return YES;
  }
  return NO;
}

@end
