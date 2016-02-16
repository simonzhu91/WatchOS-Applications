//
//  RemoteAudioController.m
//  Test
//
//  Created by Simon Zhu on 6/12/15.
//  Copyright © 2015 Simon Zhu. All rights reserved.
//

#import "RemoteAudioController.h"

@implementation RemoteAudioController

- (IBAction)startButton {
    
    NSURL *pathToRemoteSound = [NSURL URLWithString:@"https://dl.dropboxusercontent.com/s/vcex0ljq51xxjei/TestMusic.m4a"];
    if (pathToRemoteSound) {
        [self presentMediaPlayerControllerWithURL:pathToRemoteSound options:nil completion:^(BOOL disPlayToEnd, NSTimeInterval endTime, NSError * _Nullable error) {
            NSLog(@"HRE:Break here, error = %@", error);
        }];
    }
    else {
        NSLog(@"Error: Path to Audio Asset is nil");
        NSLog(@"WatchKitMediaPlayerError: %d", WatchKitMediaPlayerError);
    }
    
}


@end
