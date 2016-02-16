//
//  VideoController.m
//  Test
//
//  Created by Simon Zhu on 6/12/15.
//  Copyright © 2015 Simon Zhu. All rights reserved.
//

#import "BundleVideoController.h"
#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>

@implementation BundleVideoController

@synthesize player;

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    // Configure interface objects here.
    
}

-(void) willActivate{
    [super willActivate];
    
    [self playVideoThroughMovieURL];
}

- (void) playVideoThroughMovieURL {
    
    NSString *resource = [[NSBundle mainBundle] pathForResource:@"Test_video-480p" ofType:@"mov"];
    
    [player setMovieURL:[NSURL fileURLWithPath: resource]];
    [player setLoops:YES];
}



@end
