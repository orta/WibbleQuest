//
//  NoisyBotViewController.m
//  NoisyBot
//
//  Created by orta therox on 30/06/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "NoisyBotViewController.h"

@implementation NoisyBotViewController

- (IBAction)playClicked:(id)sender {
  // if it's already playing, stop it.
  if([audioPlayer isPlaying]) [audioPlayer stop];
  
  // Open a music file that's been dragged into the project, called boxxy.mp3
  NSString * mp3Path = [NSString stringWithFormat:@"%@/boxxy.mp3", [[NSBundle mainBundle] resourcePath]];
  NSURL *url = [NSURL fileURLWithPath:mp3Path];
  
  // create an AudioPlayer with the file used above
	NSError *error;
	audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];  
	if (audioPlayer == nil)
		NSLog(@"Error playing sound %@", [error description]);
	else
		[audioPlayer play];
}

- (IBAction)stopClicked:(id)sender {
  [audioPlayer stop];
}


@end
