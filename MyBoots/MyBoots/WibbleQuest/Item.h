//
//  Item.h
//  MyBoots
//
//  Created by orta therox on 09/07/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Item : WibbleObject

@property (retain, nonatomic) NSString* descriptionInRoom;
@property (retain, nonatomic) NSString* examine;


-(void)onPickup;
-(void)onUse;

@end
