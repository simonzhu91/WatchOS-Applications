//
//  ImageInterfaceController.m
//  SimpleWatchKitApps
//
//  Created by Simon Zhu on 9/30/15.
//  Copyright © 2015 Simon Zhu. All rights reserved.
//

#import "ImageInterfaceController.h"

@interface ImageInterfaceController ()

@end

@implementation ImageInterfaceController

@synthesize image;

// creates a new UIImage of the chrome png file to test the tintColor functionality
- (IBAction)tint {
    NSLog(@"Inside Tint");
    
    UIImage * new_image = [UIImage imageNamed:@"chrome"];
    
    new_image = [new_image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    
    [image setImage:new_image];
    [image setTintColor: [UIColor purpleColor]];
}

- (IBAction)revert {
    NSLog(@"Inside Revert");
    
    // ensure the image files are not cached
    UIImage * new_image = [UIImage imageNamed:@"chrome2"];
    
    [image setImage:new_image];
    
    
}

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    // Configure interface objects here.
    [image setImageNamed:@"chrome"];
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

@end



