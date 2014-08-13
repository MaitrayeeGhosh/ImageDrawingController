//
//  ViewController.h
//  imageDrawingController
//
//  Created by Maitrayee Ghosh on 11/08/14.
//  Copyright (c) 2014 Maitrayee Ghosh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "imageDrawingController.h"
#import <AssetsLibrary/AssetsLibrary.h>

@interface ViewController : UIViewController<imageDrawingControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *selectedImageView;
- (IBAction)didTapBringImageDrawingController:(id)sender;


@end
