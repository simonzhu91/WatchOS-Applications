//
//  AudioController.m
//  Test
//
//  Created by Simon Zhu on 6/11/15.
//  Copyright © 2015 Simon Zhu. All rights reserved.
//

#import "BundleAudioController.h"
#import <UIKit/UIKit.h>
#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>

@implementation BundleAudioController


- (IBAction)Play {
    
    
    NSURL *pathToRemoteSound = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"MediaFiles/Death Grips - Get Got" ofType:@"mp3"]];
    if (pathToRemoteSound) {
        [self presentMediaPlayerControllerWithURL:pathToRemoteSound options:nil completion:^(BOOL disPlayToEnd, NSTimeInterval endTime, NSError * _Nullable error) {
            NSLog(@"HRE:Break here, error = %@", error);
        }];
    }
    
    else{
        NSLog(@"Error: Path to Audio Asset is nil");
        NSLog(@"WatchKitMediaPlayerError: %d", WatchKitMediaPlayerError);
    }
}


- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    // Configure interface objects here.
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
