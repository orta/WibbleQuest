//
//  Store.h
//  MyBoots
//
//  Created by pH on 7/17/11.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Store : NSObject {
  NSDictionary *items;
}
-(void)beforeTrading;
-(void)afterTrading;
-(NSDictionary*)shopItems;
-(NSString *)description;
-(void)buyItem:(NSArray*)conditions;

@end
