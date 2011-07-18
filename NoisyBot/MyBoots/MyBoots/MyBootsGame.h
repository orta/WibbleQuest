//
//  MyBootsGame.h
//  MyBoots
//
//  Created by orta therox on 10/07/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyBootsGame : NSObject <WibbleQuestGameDelegate>

@property (retain, nonatomic) IBOutlet WibbleQuest *wq;

-(void)ready;

@end
