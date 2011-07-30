//
//  FloatstarPX.m
//  WibbleQuest
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
  if([sentence contains:@"it's over", @"trog dor", nil] ){
    [WQ say:@"FloatstarPX" words:@"magic"];
    return;
  }
  
  if([sentence contains:@"hi", @"hello", nil] ){
    [WQ say:@"FloatstarPX" words:@"Yo, I'm trying to get all our wires sorted, the owner said that our support band might be giving us some trouble. They want us to support them, should we?"];
    return;
  }
  
  if([sentence contains:@"yes", nil] ){
    [WQ print:@"Float laughs"];
    [WQ wait:4];
    [WQ say:@"FloatstarPX" words:@"Cynic, nah we're not supporting them. Think you can go and tell that burley looking bodyguard in the dark alley to the south that for us? Thanks."];
    return;
  }  
  
  if([sentence contains:@"no", nil] ){
    [WQ print:@"Float pauses"];
    [WQ wait:4];
    [WQ say:@"FloatstarPX" words:@"I agree, we shouldn't support them, think you can go and tell that burley looking bodyguard in the dark alley to the south that for us. Thanks."];
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
