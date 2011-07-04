//
//  NoisyBotViewController.h
//  NoisyBot
//
//  Created by orta therox on 30/06/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface NoisyBotViewController : UIViewController{
  //We keep track of the audio player here on the class
  AVAudioPlayer *audioPlayer;
  
}

// Our UIButton clicked methods
- (IBAction)playClicked:(id)sender;
- (IBAction)stopClicked:(id)sender;

@end
