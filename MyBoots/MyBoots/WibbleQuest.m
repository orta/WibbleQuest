//
//  WibbleQuest.m
//  MyBoots
//
//  Created by orta therox on 09/07/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import "WibbleQuest.h"

@implementation WibbleQuest
@synthesize view;


-(void)awakeFromNib {
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
