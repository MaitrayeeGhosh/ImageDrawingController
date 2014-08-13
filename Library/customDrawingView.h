//
//  customDrawingView.h
//  imageDrawingController
//
//  Created by Maitrayee Ghosh on 13/08/14.
//  Copyright (c) 2014 Maitrayee Ghosh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface customDrawingView : UIView
{
    @public
    CGFloat brush;
    CGFloat opacity;
    BOOL mouseSwiped;
    CGPoint lastPoint;
    CGFloat red;
    CGFloat green;
    CGFloat blue;

}
@property (strong, nonatomic) IBOutlet UIImageView *mainImageView;
@property (strong, nonatomic) IBOutlet UIImageView *tempImageView;

@end
