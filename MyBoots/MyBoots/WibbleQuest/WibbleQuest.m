//
//  WibbleQuest.m
//  MyBoots
//
//  Created by orta therox on 09/07/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

//private methods
@interface WibbleQuest()
  -(void) checkForNibConnections;
@end

@implementation WibbleQuest
@synthesize view, rooms, currentRoom;

-(void)awakeFromNib {
  [self checkForNibConnections];
  rooms = [NSMutableArray array];
}

-(void) start {

}

-(void) print:(NSString*)string{
  NSString * function = [NSString stringWithFormat:@"addParagraph(%@)", string];
  NSString * ok = [_webView stringByEvaluatingJavaScriptFromString:function];
  if([@"ok" isEqualToString:ok] == FALSE){
    NSLog(@"error printing to webview");
  }
}


-(void)addRoom:(Room*)room {
  if(!room.north && !room.south && !room.west && !room.east){
    NSLog(@"The Room %@ has no connections", room.name);
  }
  [rooms addObject:room];
  [room retain];
}

- (BOOL)textFieldShouldReturn:(UITextField *)inTextField{
	[inTextField resignFirstResponder];
  return YES;
}

-(void) checkForNibConnections{
  if(_webView == nil){
    [NSException raise:@"Web View not hooked up to WibbleQuest Object in Nib" format:@"Web View not hooked up to WibbleQuest Object in Nib"];
  }
  if(_textField == nil){
    [NSException raise:@"Text Field not hooked up to WibbleQuest Object" format:@"Text Field not hooked up to WibbleQuest Object"];
  }
  if(_textField.delegate != self){
    [NSException raise:@"Text Field delegate not hooked up to WibbleQuest Object" format:@"Text Field delegate not hooked up to WibbleQuest Object"];
  }
  if(view == nil){
    [NSException raise:@"Web View not hooked up to WibbleQuest Object in Nib" format:@"Web View not hooked up to WibbleQuest Object in Nib"];
  }
}


@end
