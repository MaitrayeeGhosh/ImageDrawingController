//
//  ViewController.m
//  imageDrawingController
//
//  Created by Maitrayee Ghosh on 11/08/14.
//  Copyright (c) 2014 Maitrayee Ghosh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)setNavigationRightBarButton
{
    UIBarButtonItem *UseBtn=[[UIBarButtonItem alloc]initWithTitle:@"Save Photo" style:UIBarButtonItemStyleDone target:self action:@selector(savePhoto)];
    self.navigationItem.rightBarButtonItem=UseBtn;
}

- (void)setNavigationLaftBarButton
{
    UIBarButtonItem *galleryBtn=[[UIBarButtonItem alloc]initWithTitle:@"Gallery" style:UIBarButtonItemStyleDone target:self action:@selector(PickPhotoFromGalary)];
    self.navigationItem.leftBarButtonItem=galleryBtn;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
	[self setNavigationRightBarButton];
    
    [self setNavigationLaftBarButton];
}


-(void)PickPhotoFromGalary
{
    UIImagePickerController *imagepic=[[UIImagePickerController alloc]init];
    imagepic.delegate=(id)self;
    imagepic.sourceType=UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    [self presentViewController:imagepic animated:YES completion:nil];
}

#pragma  mark - UIImagePickerController Delegates

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *selectedimage=[info objectForKey:UIImagePickerControllerOriginalImage];
    _selectedImageView.image=selectedimage;
    [picker dismissViewControllerAnimated:YES completion:nil];

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)savePhoto
{
    CIImage *SaveImage = [[CIImage alloc] initWithCGImage:_selectedImageView.image.CGImage options:nil];
    CIContext *context = [CIContext contextWithOptions:nil];
    context = [CIContext contextWithOptions:nil];
    
    CGImageRef cgImg = [context createCGImage:SaveImage
                                     fromRect:[SaveImage extent]];
    
    ALAssetsLibrary* library = [[ALAssetsLibrary alloc] init];
    [library writeImageToSavedPhotosAlbum:cgImg
                                 metadata:[SaveImage properties]
                          completionBlock:^(NSURL *assetURL, NSError *error) {
                              UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Congrats" message:@"Photo saved in album" delegate:Nil cancelButtonTitle:@"OK"
                                otherButtonTitles:nil];
                              [alertView show];
                              NSLog(@"error: %@",error);
                              
                              CGImageRelease(cgImg);
                          }];
 
}


- (IBAction)didTapBringImageDrawingController:(id)sender {
    imageDrawingController *controller=[[imageDrawingController alloc]init];
    controller.canvasImageForDrawing=_selectedImageView.image;
    controller.delegate=self;
   controller.pencilColor=[UIColor redColor];
    controller->brushThickness=4.0f;
    UINavigationController *navigationController=[[UINavigationController alloc]initWithRootViewController:controller];
    [self presentViewController:navigationController animated:YES completion:nil];
  
}


#pragma mark - imageDrawingController Delegate

-(void)didFinishDrawing:(UIImage *)finalImage
{
    _selectedImageView.image=finalImage;
}


@end
