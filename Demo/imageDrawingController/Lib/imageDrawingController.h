//
//  imageDrawingController.h
//  imageDrawingController
//
//  Created by Maitrayee Ghosh on 11/08/14.
//  Copyright (c) 2014 Maitrayee Ghosh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "customDrawingView.h"

@protocol imageDrawingControllerDelegate <NSObject>
-(void)didFinishDrawing:(UIImage *)finalImage;
@end

@interface imageDrawingController : UIViewController
{
    @public
    CGFloat brushThickness;
    CGFloat red;
    CGFloat green;
    CGFloat blue;
    customDrawingView *customView;

}
@property(nonatomic,assign)id<imageDrawingControllerDelegate> delegate;
@property (strong, nonatomic) IBOutlet UIImage *canvasImageForDrawing;
@property (strong, nonatomic) IBOutlet UIColor *pencilColor;



@end
