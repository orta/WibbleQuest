//
//  Sound.m
//  WibbleQuest
//
//  Created by Michael Jaoudi on 8/17/11.
//  Copyright 2011 http://ortatherox.com. Licensed under Creative Commons
//

#import "Sound.h"

@implementation Sound

+(void)play:(NSString*)file{
  NSString * mp3Path = [NSString stringWithFormat:@"%@/%@", [[NSBundle mainBundle] resourcePath],file];
  NSURL *url = [NSURL fileURLWithPath:mp3Path];
  
  // create an AudioPlayer with the file used above
	NSError *error;
	AVAudioPlayer* audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];  
	if (audioPlayer == nil)
		NSLog(@"Error playing sound %@", [error description]);
	else
		[audioPlayer play];
}

@end
