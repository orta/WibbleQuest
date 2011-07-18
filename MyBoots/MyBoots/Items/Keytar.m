//
//  Keytar.m
//  MyBoots
//
//  Created by orta therox on 16/07/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import "Keytar.h"

@implementation Keytar

- (id)init {
  self = [super init];
  if (self) {
    self.descriptionInRoom = @"Your Keytar is hanging from the roof, how did it ever get there?";
    self.description = @"Your Keytar is a beautiful 80s mix of a guitar and a keyboard allowing you to mash buttons without needing to stand behind a keyboard. A perfect mix.";
    self.id = @"keytar";
    self.name = @"Keytar";
  }
  return self;
}

-(void) onPickup{
  [WQ print:@"You put the strap over your head and swing the Keytar over to your back."];
}

-(BOOL)didRespondToCommand:(NSArray*)commandArray {
  NSString * command = [commandArray objectAtIndex:0];
  NSArray *commands = [NSArray arrayWithObjects:@"play", nil];
  if ([commands containsObject:command]) {
    [WQ print:@"You rock out on the Keytar for a while playing some George Michaels, no one seems to pay any attention though"];
    return YES;
  }
  return NO;
}


@end
