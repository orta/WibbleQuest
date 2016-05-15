//
//  Game.h
//  WibbleQuest
//
//  Created by orta therox on 01/08/2011.
//  Copyright 2011 http://ortatherox.com. Licensed under Creative Commons
//

#import <Foundation/Foundation.h>
@class WibbleQuest, Creature;

@interface Game : NSObject {
    IBOutlet WibbleQuest *wq;
}

@property (strong, nonatomic) IBOutlet WibbleQuest *wq;
-(NSString *)gameDescription;
-(NSString *)gameName;
-(void)ready;
-(void)playerWasBeatenBy:(Creature*)creature;
@end
