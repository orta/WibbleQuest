//
//  Doc.m
//  MyBoots
//
//  Created by orta therox on 15/07/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import "Doc.h"

@implementation Doc

-(void)respondToSentenceArray:(NSArray*)sentence {
  if([sentence contains:@"hi", @"hello", nil] ){
    [WQ print:@"Doc says, Oh wow, glad you've arrived! Looks like a monster has taken over a campers room and will only play cheesey canadian pop. Please help us!"];
    return;
  }
  
  if([sentence contains:@"confused", @"monster", nil] ){
    [WQ print:@"Doc says, Yeah a monster, I'm not really sure what to do about it, at least you have some ninja skills that could come in handy!"];
    return;
  }  
  
  if([sentence contains:@"pop", @"canadian", @"justin", @"bieber", nil] ){
    [WQ print:@"Doc says, Yeah, there's some really bad music going on over there, I dunno how long I can take it."];
    return;
  }

  [WQ print:@"Doc looks at you oddly!"];
}

@end
