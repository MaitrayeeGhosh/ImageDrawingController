//
//  AppDelegate.m
//  imageDrawingController
//
//  Created by Maitrayee Ghosh on 11/08/14.
//  Copyright (c) 2014 Maitrayee Ghosh. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self setNavigationBarColor];
    return YES;
}


-(void)setNavigationBarColor
{
    float version=[[[UIDevice currentDevice] systemVersion] floatValue];
    if(version>=7.0)
    {
        
        [[UINavigationBar appearance]setBarTintColor:[UIColor colorWithRed:0.2274 green:0.1529 blue:0.0705 alpha:1]];
        [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    }
    else
    {
        
        [[UINavigationBar appearance]setTintColor:[UIColor colorWithRed:0.2274 green:0.1529 blue:0.0705 alpha:1]];
    }
    
    [self setNavigationBarTitleColor];
    
}

-(void)setNavigationBarTitleColor
{
    NSDictionary *textTitleOptions = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], UITextAttributeTextColor, [UIColor whiteColor], UITextAttributeTextShadowColor, nil];
    [[UINavigationBar appearance] setTitleTextAttributes:textTitleOptions];
    [[UIBarButtonItem appearance] setTitleTextAttributes:textTitleOptions forState:UIControlStateNormal];
}

							

@end
