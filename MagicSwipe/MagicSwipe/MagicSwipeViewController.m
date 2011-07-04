//
//  MagicSwipeViewController.m
//  MagicSwipe
//
//  Created by orta therox on 03/07/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import "MagicSwipeViewController.h"
#import <AVFoundation/AVFoundation.h>

@implementation MagicSwipeViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  [coinImageView setImage:[UIImage imageNamed:@"heads.png"]];
  isHeads = YES;
  [[NSNotificationCenter defaultCenter] 
     addObserver:self
        selector:@selector(proximityStateDidChange:)
            name:@"UIDeviceProximityStateDidChangeNotification" object:nil];
  [self switchImage];
}

-(void)proximityStateDidChange:(NSNotification*)notification {
	if([[UIDevice currentDevice] proximityState]){
		[self switchImage];
	}
}

-(void)switchImage {
  //  simple switch image
  if( isHeads ){
    [coinImageView setImage:[UIImage imageNamed:@"tails.png"]];
  }else{
    [coinImageView setImage:[UIImage imageNamed:@"heads.png"]];
  }
  
  
  // play ting.mp3
  NSString *soundPath = [[NSBundle mainBundle] pathForResource:@"ting" ofType:@"mp3"];
  AVAudioPlayer *tingSound =[[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:soundPath] error:NULL];
  [tingSound play];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)i {
  return YES;
}
@end
