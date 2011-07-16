//
//  FloatstarPX.m
//  MyBoots
//
//  Created by orta therox on 16/07/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import "FloatstarPX.h"
#import "Microphone.h"

@implementation FloatstarPX
-(void)playerEntersSameRoom {
  if ( !saidHello ) {
    [WQ say:@"FloatstarPX" words:@"Oh hey orta."];
    saidHello = YES;
  }
}

-(void)respondToSentenceArray:(NSArray*)sentence {
  if([sentence contains:@"hi", @"hello", nil] ){
    [WQ say:@"FloatstarPX" words:@"Hey there orta, I'm trying to get all our wires sorted, the owner said that our support band might be giving us some trouble. They want us to support them, should we?"];
    return;
  }
  
  if([sentence contains:@"yes", @"no", nil] ){
    [WQ say:@"FloatstarPX" words:@"I agree, we shouldn't support them, think you can go and tell that burley looking bodyguard in the dark alley out back that for us. Thanks."];
    return;
  }  
  
  if([sentence contains:@"band", @"support", @"trouble", nil] ){
    [WQ say:@"FloatstarPX" words:@"Yeah, they're some trendy indie rock band. Not sure how they ended up supporting us but I'm happy that they are, let's keep it that way."];
    return;
  }    

  if([sentence contains:@"mic", @"mics", @"microphone", @"microphones", nil] ){
    [WQ say:@"FloatstarPX" words:@"Ah yeah, the microphones, I spotted them earlier, here you go"];
    Microphone *mic = [[Microphone alloc] init];
    WibbleQuest * wibble = [WibbleQuest sharedWibble];
    [wibble.inventory addItem: mic];
    
    return;
  }  

  [WQ print:@"Float doesn't seem to understand what you say really and just ignores you."];
}

@end
