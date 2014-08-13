//
//  imageDrawingController.m
//  imageDrawingController
//
//  Created by Maitrayee Ghosh on 11/08/14.
//  Copyright (c) 2014 Maitrayee Ghosh. All rights reserved.
//

#import "imageDrawingController.h"

@interface imageDrawingController ()

@end

@implementation imageDrawingController



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor blackColor];
  
    [self setNavigationRightBarButton];
    [self setNavigationLeftBarButton];
    if (brushThickness==0) {
        brushThickness=3.0;
    }
        
    if (_pencilColor!=nil) {
       
        [self getRGBValueFromUserProvidedPencilColor];
    }
    else
    {
        [self setDefaultPencilColor];
    }
  
}

- (void)setDefaultPencilColor
{
    red = 0.0/255.0;
    green = 0.0/255.0;
    blue = 0.0/255.0;
    [self calculateImageViewHeightForCanvasImage];
}

- (void)getRGBValueFromUserProvidedPencilColor
{
    CGFloat components[3];
    [self getRGBComponents:components forColor:_pencilColor];
    NSLog(@"%f %f %f", components[0], components[1], components[2]);
    red=components[0];
    green=components[1];
    blue=components[2];
    [self calculateImageViewHeightForCanvasImage];
}

- (void)getRGBComponents:(CGFloat [3])components forColor:(UIColor *)color {
    CGColorSpaceRef rgbColorSpace = CGColorSpaceCreateDeviceRGB();
    unsigned char resultingPixel[4];
    CGContextRef context = CGBitmapContextCreate(&resultingPixel,
                                                 1,
                                                 1,
                                                 8,
                                                 4,
                                                 rgbColorSpace,kCGImageAlphaNoneSkipLast);
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, CGRectMake(0, 0, 1, 1));
    CGContextRelease(context);
    CGColorSpaceRelease(rgbColorSpace);
    
    for (int component = 0; component < 3; component++) {
        components[component] = resultingPixel[component] / 255.0f;
    }
}


- (void)setNavigationRightBarButton
{
    self.navigationItem.hidesBackButton=YES;
    UIBarButtonItem *doneBtn=[[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(didTapDoneBtn)];
    self.navigationItem.rightBarButtonItem=doneBtn;
}

- (void)setNavigationLeftBarButton
{
    UIBarButtonItem *cancelBtn=[[UIBarButtonItem alloc]initWithTitle:@"Cancel" style:UIBarButtonItemStyleDone target:self action:@selector(didTapBackBtn)];
    self.navigationItem.leftBarButtonItem=cancelBtn;
}



#pragma mark - Done Filtering

-(void)didTapDoneBtn
{
    
    /************ for custom delegate ***************/
    
    if([_delegate respondsToSelector:@selector(didFinishDrawing:)])
    {
        NSLog(@"enter");
        if([self delegate])
        {
            [[self delegate] didFinishDrawing:customView.mainImageView.image];
        }
        
    }
    
   [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)didTapBackBtn
{
    [self dismissViewControllerAnimated:YES completion:nil];
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGSize)getSizeOfCanvasImageForDrawing:(UIImage *)targetImage
{
    CGSize size=CGSizeMake(targetImage.size.width, targetImage.size.height);
    return size;
}

- (void)calculateImageViewHeightForCanvasImage
{
   CGSize imageSize = [self getSizeOfCanvasImageForDrawing:_canvasImageForDrawing];
    
   float imageViewHeight=(320/imageSize.width)*imageSize.height;
    [self setImageViewFrameBasedOnImageSize:imageViewHeight];
}

- (void)setImageViewFrameBasedOnImageSize:(float)height
{
    float y=((self.view.frame.size.height)-height)/2;
    customView=[[customDrawingView alloc]initWithFrame:CGRectMake(0, y, 320, height)];
    customView.mainImageView.image=_canvasImageForDrawing;
    customView->red=red;
    customView->blue=blue;
    customView->green=green;
    customView->brush=brushThickness;
    [self.view addSubview:customView];
  
}


@end
