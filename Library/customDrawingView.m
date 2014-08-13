//
//  customDrawingView.m
//  imageDrawingController
//
//  Created by Maitrayee Ghosh on 13/08/14.
//  Copyright (c) 2014 Maitrayee Ghosh. All rights reserved.
//

#import "customDrawingView.h"

@implementation customDrawingView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _mainImageView=[[UIImageView alloc]initWithFrame:self.bounds];
          _mainImageView.contentMode=UIViewContentModeScaleToFill;
        _tempImageView=[[UIImageView alloc]initWithFrame:self.bounds];
        _tempImageView.contentMode=UIViewContentModeScaleToFill;
        
        [self addSubview:_mainImageView];
        [self addSubview:_tempImageView];
        opacity = 1.0;

    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
 
 mouseSwiped = NO;
 UITouch *touch = [touches anyObject];
 lastPoint = [touch locationInView:self];
 
 }
 
 - (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
 
 mouseSwiped = YES;
 UITouch *touch = [touches anyObject];
 CGPoint currentPoint = [touch locationInView:self];
 
 UIGraphicsBeginImageContext(self.frame.size);
 [self.tempImageView.image drawInRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
 
 CGContextMoveToPoint(UIGraphicsGetCurrentContext(), lastPoint.x, lastPoint.y);
 CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), currentPoint.x, currentPoint.y);
 CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
 CGContextSetLineWidth(UIGraphicsGetCurrentContext(), brush );
 CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), red, green, blue, 1.0);
 CGContextSetBlendMode(UIGraphicsGetCurrentContext(),kCGBlendModeNormal);
 
 CGContextStrokePath(UIGraphicsGetCurrentContext());
 self.tempImageView.image = UIGraphicsGetImageFromCurrentImageContext();
 [self.tempImageView setAlpha:opacity];
 UIGraphicsEndImageContext();
 
 lastPoint = currentPoint;
 }
 
 - (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
 UIGraphicsBeginImageContext(self.frame.size);
 [self.mainImageView.image drawInRect:CGRectMake(0, 0,self.mainImageView.frame.size.width,self.mainImageView.frame.size.height) blendMode:kCGBlendModeNormal alpha:1.0];
 [self.tempImageView.image drawInRect:CGRectMake(0, 0, self.tempImageView.frame.size.width,self.tempImageView.frame.size.height) blendMode:kCGBlendModeNormal alpha:opacity];
 self.mainImageView.image = UIGraphicsGetImageFromCurrentImageContext();
 self.tempImageView.image = nil;
 UIGraphicsEndImageContext();
 
 }



@end
