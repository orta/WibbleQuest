//
//  WibbleQuestSwipeHandlers.m
//  WibbleQuest
//
//  Created by orta therox on 31/07/2011.
//  Copyright 2011 http://ortatherox.com. Licensed under Creative Commons
//

#import "WibbleQuestSwipeHandlers.h"

@implementation WibbleQuest (WibbleQuestSwipeHandling)

-(void)setupCommandSwipes {  
  UISwipeGestureRecognizer *gestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(commandSwipeUp:)];
  gestureRecognizer.delegate = self;
  gestureRecognizer.direction = UISwipeGestureRecognizerDirectionUp;
  [_textField addGestureRecognizer:gestureRecognizer];

  UISwipeGestureRecognizer *downRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(commandSwipeDown:)];
  downRecognizer.delegate = self;
  downRecognizer.direction = UISwipeGestureRecognizerDirectionDown;
  [_textField addGestureRecognizer:downRecognizer];

}

-(void)commandSwipeDown:(id)sender{
  if (_commandIndex == 0 ) return;
  _commandIndex--;
  _textField.text = [[self previousCommands] objectAtIndex:_commandIndex];
}

-(void)commandSwipeUp:(id)sender{
  if (_commandIndex == [[self previousCommands] count] - 1 ) return;
  _commandIndex++;
  _textField.text = [[self previousCommands ] objectAtIndex:_commandIndex];
}



@end
