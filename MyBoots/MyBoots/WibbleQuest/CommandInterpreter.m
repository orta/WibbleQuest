//
//  CommandInterpreter.m
//  MyBoots
//
//  Created by orta therox on 10/07/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import "CommandInterpreter.h"

@implementation CommandInterpreter
@synthesize wq;

-(void)parse:(NSString*) string {
  NSArray * parameters = [string componentsSeparatedByString:@" "];
  if ([parameters count] == 1) {
    NSString * command = [parameters objectAtIndex:0];
    if([@"help" isEqualToString:command]){
      [self help];
    }
    
    
  }

}


-(void) help {
  if([wq.game respondsToSelector:@selector(help)]){
    [wq.game help];
  }else{
    
    [wq title:@"Help File"];
    
    [wq print:@""];
    
  }
}

@end
