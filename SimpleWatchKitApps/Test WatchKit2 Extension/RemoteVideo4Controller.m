//
//  RemoteVideo4Controller.m
//  SimpleWatchKitApps
//
//  Created by Simon Zhu on 9/25/15.
//  Copyright © 2015 Simon Zhu. All rights reserved.
//

#import "RemoteVideo4Controller.h"

@implementation RemoteVideo4Controller

@synthesize movie;

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];


    NSURL * url = [NSURL URLWithString:@"https://dl.dropboxusercontent.com/s/j8bjft3265l3g0y/120fps%20%281%29.mp4"];

    [movie setMovieURL: url];
    [movie setLoops: TRUE];
    [movie setVideoGravity: WKVideoGravityResizeAspect];

    WKImage * image = [WKImage imageWithImageName: @"frame0.png"];
    
//    [image setTintColor: [UIColor yellowColor]];
    
    [movie setPosterImage: image];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

@end



