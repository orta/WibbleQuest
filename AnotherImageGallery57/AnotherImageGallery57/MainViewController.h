//
//  MainViewController.h
//  AnotherImageGallery57
//
//  Created by orta therox on 02/07/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import "FlipsideViewController.h"

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate> {
  IBOutlet UIImageView *mainImageView;
}

- (IBAction)showInfo:(id)sender;
- (void)setMainImage:(NSString *)imageName;
@end
