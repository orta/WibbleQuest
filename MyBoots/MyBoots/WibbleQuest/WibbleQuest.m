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
-(void) loadPageForShowingGame;
-(void) describeSurroundings;
@end

@implementation WibbleQuest

@synthesize view, rooms, currentRoom, game;

-(void)awakeFromNib {
  // setup wibble for allowing any game actions
  // before allowing the game to start adding
  // rooms and other data
  
  [self checkForNibConnections];

  // we do this last, as it has a delegate method when it's ready
  [self loadPageForShowingGame];
  _textField.clearsOnBeginEditing = YES;
}

- (void)webViewDidFinishLoad:(UIWebView *) delagateWebView {
  [game ready];
}

-(void) start {
  [self heading:[game gameName]];
  [self print:[game gameDescription]];
  // just a neat gap
  [self heading:@""];
  
  [self describeSurroundings];
  
}

// think about moving this into Room
-(void) describeSurroundings {
  [self title:currentRoom.name];
  [self print:currentRoom.description];
  if(currentRoom.items){
    //TODO
  }
  
  if(currentRoom.encounter){
    //TODO
  }
}

-(void)addRoom:(Room*)room {
  // custom adding room, this allows some error handling
  if(!room.north && !room.south && !room.west && !room.east){
    NSLog(@"The Room %@ has no connections", room.name);
  }
  [room retain];
  if (self.rooms == nil) {
    self.rooms = [NSMutableArray arrayWithObject:room];
  }else{
    [rooms addObject:room];  
  }
}

- (BOOL)textFieldShouldReturn:(UITextField *)inTextField {
	[inTextField resignFirstResponder];
  [self command:[@"> " stringByAppendingString: inTextField.text]];
  
  inTextField.text = @"";
  return YES;
}

#pragma error handling and loading

-(void) loadPageForShowingGame {
  NSString *path = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"];
  NSURL *url = [NSURL fileURLWithPath:path];
  NSURLRequest * request = [NSURLRequest requestWithURL:url];
  [_webView loadRequest:request];
}

-(void) checkForNibConnections {
  if(_webView == nil){
    [NSException raise:@"Web View is not hooked up to WibbleQuest Object in Nib" format:@"Web View is not hooked up to WibbleQuest Object in Nib"];
  }
  
  if(_webView.delegate != self){
    [NSException raise:@"Web View delegate is not hooked up to WibbleQuest Object" format:@"Web View delegate is not hooked up to WibbleQuest Object"];
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
