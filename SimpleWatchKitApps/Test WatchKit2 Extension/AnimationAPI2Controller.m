//
//  Animation2Controller.m
//  SimpleWatchKitApps
//
//  Created by Simon Zhu on 6/22/15.
//  Copyright © 2015 Simon Zhu. All rights reserved.
//

#import "AnimationAPI2Controller.h"

@implementation AnimationAPI2Controller

@synthesize image;

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
    
    [self testAnimatingWithImagesInRange];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

// Testing: startAnimatingWithImagesInRange
- (void) testAnimatingWithImagesInRange {
    
    NSLog(@"Calling startAnimatingWithImagesInRange");
    
    // calls setImageNamed using a string
    [image setImageNamed: @"lightsaber"];
    
    [image startAnimatingWithImagesInRange: NSMakeRange(0, 131) duration:1 repeatCount:0 ];
    
    NSLog(@"End Calling startAnimatingWithImagesInRange");
    
    [self performSelector:@selector(testAnimateImages) withObject:nil afterDelay:1.0];
}

// Testing: startAnimating
- (void) testAnimateImages {
    
    NSLog(@"Calling startAnimating");
    
    UIImage * ui_image = [UIImage imageNamed:@"lightsaber"];
    
    // calls setImage using a UI image
    [image setImage: ui_image];
    
    [image startAnimating];
    
    NSLog(@"End Calling startAnimating");
}


@end
