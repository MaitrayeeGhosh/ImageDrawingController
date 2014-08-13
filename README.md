ImageDrawingController
======================

It is a controller for drawing on an image. User can pass an image to the controller and mention the desired pencil colour and pencil brush width and start drawing.

Feature:
       Draw on an image with any color and any brush width.

System Requirements:
                   Need iOS 7.0 or higher.

Usage:
         
    imageDrawingController *controller=[[imageDrawingController alloc]init];
    controller.canvasImageForDrawing=_selectedImageView.image;
    controller.delegate=self;
    controller.pencilColor=[UIColor redColor];
    controller->brushThickness=5.0f;
    UINavigationController *navigationController=[[UINavigationController   alloc]initWithRootViewController:controller];
    [self presentViewController:navigationController animated:YES completion:nil];

     setting the pencil colour and brush width is optional. 
