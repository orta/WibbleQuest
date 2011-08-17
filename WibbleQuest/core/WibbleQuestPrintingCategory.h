//
//  WibbleQuestPrintingCategory.h
//  WibbleQuest
//
//  Created by orta therox on 10/07/2011.
//  Copyright 2011 http://ortatherox.com. Licensed under Creative Commons
//

#import "WibbleQuest.h"

@interface WibbleQuest (WibbleQuestPrintingCategory) 


-(void)wait:(float)time;

// any extra narratives
-(void) print:(NSString*)string, ...;
-(void) heading:(NSString*)string;
-(void) command:(NSString*)string;
-(void) title:(NSString*)string;
-(void) say:(NSString*)name words:(NSString*)words;
-(void) art:(NSString*)art;
-(void) image:(NSString*)image;

// private, but whatever
-(void) execJS:(NSString*) js;
-(NSString *) sanitize:(NSString*) string;

@end
