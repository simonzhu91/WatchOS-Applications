//
//  RemoteVideoController.m
//  Test
//
//  Created by Simon Zhu on 6/12/15.
//  Copyright © 2015 Simon Zhu. All rights reserved.
//

#import "RemoteVideoController.h"

@implementation RemoteVideoController

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
        
        NSURL *pathToRemoteVideo = [NSURL URLWithString:@"https://dl.dropboxusercontent.com/s/z7oxiug5szwhihz/Test_video-480p.mov"];
        
        if (pathToRemoteVideo) {
            [self presentMediaPlayerControllerWithURL:pathToRemoteVideo options:nil completion:^(BOOL disPlayToEnd, NSTimeInterval endTime, NSError * _Nullable error) {
                NSLog(@"HRE:Break here, error = %@", error);
            }];
        }

        
    }



@end
