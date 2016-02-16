//
//  AnimationAPIController.m
//  Test
//
//  Created by Simon Zhu on 6/15/15.
//  Copyright © 2015 Simon Zhu. All rights reserved.
//

#import "AnimationAPIController.h"

@implementation AnimationAPIController

    @synthesize image;

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    // Configure interface objects here.
    
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
    
    
    // Tests the Animations by first calling AnimationInRange and then StartAnimating
    [self testAnimatingWithImagesInRange];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}


// Testing: startAnimatingWithImagesInRange
- (void) testAnimatingWithImagesInRange {
    
    NSLog(@"Calling startAnimatingWithImagesInRange");
    
    [image setImageNamed: @"frame"];
    
    [image startAnimatingWithImagesInRange: NSMakeRange(0, 131) duration:5 repeatCount:0 ];
    
    [image performSelector:@selector(stopAnimating) withObject:nil afterDelay:3.0];
    
    [image performSelector:@selector(startAnimating) withObject:nil afterDelay:10.0];
    
    [self performSelector:@selector(testAnimateImages) withObject:nil afterDelay:1.0];
}

// Testing: startAnimating
// This will start the Animation sequence and after 2 seconds, stop, and then rebegin the animation sequence after 2 seconds again
- (void) testAnimateImages {
    
    NSLog(@"Calling startAnimating");
    
    // Creates an Animated Image with prefix of Frame
    UIImage * img = [UIImage animatedImageNamed:@"frame" duration:5];
    
    // Archives the Image
    NSData * data = UIImagePNGRepresentation(img);

    // tests the WKInterfaceImage's setImage API passing in NSData object
    [image setImageData: data];
    
    [image setTintColor: [UIColor blackColor]];
}




@end
