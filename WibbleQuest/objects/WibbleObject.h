//
//  Object.h
//  WibbleQuest
//
//  Created by orta therox on 18/07/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WibbleObject : NSObject

@property (retain, nonatomic) NSString* id;
@property (retain, nonatomic) NSString* description;
@property (retain, nonatomic) NSString* name;

-(BOOL)didRespondToCommand:(NSArray*)commandArray;

-(void)tick;
@end
