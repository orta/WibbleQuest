//
//  GemClockViewController.m
//  GemClock
//
//  Created by orta therox on 03/07/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import "GemClockViewController.h"

@implementation GemClockViewController

-(void)viewDidLoad{
  [super viewDidLoad];
  // 4 times a second
  [NSTimer scheduledTimerWithTimeInterval:1 / 4
                                   target:self 
                                 selector:@selector(updateTime) 
                                 userInfo:nil 
                                  repeats:YES];
}

-(void)updateTime {
  // all girls are 15 minutes late. Take this into account
  // and make sure they think they're 15 minutes late already
  
  NSDate *date = [NSDate dateWithTimeIntervalSinceNow: (15 * 60)];
  
  // we want to set a format that we can get the string from the date
  // http://codex.wordpress.org/Formatting_Date_and_Time
  
  NSDateFormatter *hourFormatter = [[[NSDateFormatter alloc]init]autorelease];
  hourFormatter.dateFormat = @"HH";
  NSString *hourString = [hourFormatter stringFromDate:date];

  NSDateFormatter *minFormatter = [[[NSDateFormatter alloc]init]autorelease];
  minFormatter.dateFormat = @"mm";
  NSString *minString = [minFormatter stringFromDate:date];

  [hourLabel setText: hourString];
  [minuteLabel setText:minString];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
  return YES;
}
@end
