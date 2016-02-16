//
//  RemoteVideoController.m
//  Test
//
//  Created by Simon Zhu on 6/12/15.
//  Copyright © 2015 Simon Zhu. All rights reserved.
//

#import "RemoteVideo2Controller.h"

@implementation RemoteVideo2Controller

@synthesize player;

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    // Configure interface objects here.
    
}


- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
    
    [self playVideoThroughMovieURL];
}



- (void)playVideoThroughMovieURL {
    
    NSURL * pathToRemoteVideo = [NSURL URLWithString:@"https://dl.dropboxusercontent.com/s/j8bjft3265l3g0y/120fps%20%281%29.mp4"];
    
    if (pathToRemoteVideo) {
        [self presentMediaPlayerControllerWithURL:pathToRemoteVideo options:nil completion:^(BOOL disPlayToEnd, NSTimeInterval endTime, NSError * _Nullable error) {
            NSLog(@"HRE:Break here, error = %@", error);
        }];
    }
    
    
}



@end
