//
//  BundleVideo2Controller.m
//  SimpleWatchKitApps
//
//  Created by Simon Zhu on 9/25/15.
//  Copyright © 2015 Simon Zhu. All rights reserved.
//

#import "BundleVideo2Controller.h"

@interface BundleVideo2Controller ()

@end

@implementation BundleVideo2Controller

@synthesize movie;

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
    
    NSURL * url = [NSURL fileURLWithPath: [[NSBundle mainBundle] pathForResource:@"Test_video-480p" ofType:@"mov"]];
    
    [movie setMovieURL: url];
    [movie setLoops: TRUE];
    [movie setVideoGravity: WKVideoGravityResizeAspect];
    
    WKImage * image = [WKImage imageWithImageName: @"frame0.png"];
    
    [movie setPosterImage: image];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

@end



