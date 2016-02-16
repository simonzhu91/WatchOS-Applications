//
//  RemoteVideoController.m
//  Test
//
//  Created by Simon Zhu on 6/12/15.
//  Copyright © 2015 Simon Zhu. All rights reserved.
//

#import "RemoteVideo3Controller.h"

@implementation RemoteVideo3Controller

@synthesize player;

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    // Configure interface objects here.
    
}


- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
    
    // plays the video immediately when the controller is rendered
    [self playVideoThroughMovieURL];
}


// Tests for presentMediaPlayerControllerWithURL
- (void)playVideoThroughMovieURL {
    
    NSURL *pathToRemoteVideo = [NSURL URLWithString:@"https://dl.dropboxusercontent.com/s/4gqb85pvq1eppke/3gp.3gp"];
    
    if (pathToRemoteVideo) {
        [self presentMediaPlayerControllerWithURL:pathToRemoteVideo options:nil completion:^(BOOL disPlayToEnd, NSTimeInterval endTime, NSError * _Nullable error) {
            NSLog(@"HRE:Break here, error = %@", error);
        }];
    }
}

@end
