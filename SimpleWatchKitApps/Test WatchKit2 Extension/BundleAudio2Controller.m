//
//  AudioController.m
//  Test
//
//  Created by Simon Zhu on 6/11/15.
//  Copyright © 2015 Simon Zhu. All rights reserved.
//

#import "BundleAudio2Controller.h"
#import <UIKit/UIKit.h>
#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>

@implementation BundleAudio2Controller: WKInterfaceController


- (IBAction)Play {
    
    NSURL *pathToRemoteSound = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"MediaFiles/aif" ofType:@"aif"]];
    if (pathToRemoteSound) {
        [self presentMediaPlayerControllerWithURL:pathToRemoteSound options:nil completion:^(BOOL disPlayToEnd, NSTimeInterval endTime, NSError * _Nullable error) {
            NSLog(@"HRE:Break here, error = %@", error);
            NSLog(@"WatchKitMediaPlayerError: %d", WatchKitMediaPlayerError);
        }];
    }
    
    else{
        NSLog(@"Error: Path to Audio Asset is nil");
        NSLog(@"WatchKitMediaPlayerError: %d", WatchKitMediaPlayerError);
    }
}

- (void)awakeWithContext:(nullable id)context {
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
