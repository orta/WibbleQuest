//
//  CommandInterpreter.h
//  WibbleQuest
//
//  Created by orta therox on 10/07/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommandInterpreter : NSObject{
  BOOL _madeFirstMistake;
}

  @property (retain, nonatomic) IBOutlet WibbleQuest *wq;
  -(void) parse:(NSString*) string;

@end
