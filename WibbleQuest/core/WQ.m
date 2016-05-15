//
//  WQ.m
//  WibbleQuest
//
//  Created by orta therox on 11/07/2011.
//  Copyright 2011 http://ortatherox.com. Licensed under Creative Commons
//

#import "WQ.h"

@implementation WQ

+(void) print:(NSString*)string, ...{
  if (string == nil) {
    NSLog(@"nil string somewhere in WQ print");
    return;
  }
  // do all the argument parsing ourselves and pass through the rendered string
  va_list listOfArguments;
  va_start(listOfArguments, string);
  NSString* formattedString = [[NSString alloc] initWithFormat:string arguments:listOfArguments];

  WibbleQuest *wibble = [WibbleQuest sharedWibble];
  [wibble print:formattedString];
}

+(void) wait:(int)time {  
  WibbleQuest *wibble = [WibbleQuest sharedWibble];
  [wibble wait:time];
}

+(void) heading:(NSString*)string{
  WibbleQuest *wibble = [WibbleQuest sharedWibble];
  [wibble heading:string];
}

+(void) say:(NSString*)name words:(NSString*)words {
  WibbleQuest *wibble = [WibbleQuest sharedWibble];
  [wibble say:name words:words];
}


+(void) command:(NSString*)string{
  WibbleQuest *wibble = [WibbleQuest sharedWibble];
  [wibble command:string];
}

+(void) title:(NSString*)string{
  WibbleQuest *wibble = [WibbleQuest sharedWibble];
  [wibble title:string];
}

+(void) art:(NSString*)string{
  WibbleQuest *wibble = [WibbleQuest sharedWibble];
  [wibble art:string];
}

+(void) image:(NSString*)string{
    WibbleQuest *wibble=[WibbleQuest sharedWibble];
    [wibble image:string];
}

@end
