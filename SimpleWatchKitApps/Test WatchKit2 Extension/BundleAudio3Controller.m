//
//  BundleAudioController3.m
//  SimpleWatchKitApps
//
//  Created by Simon Zhu on 9/9/15.
//  Copyright © 2015 Simon Zhu. All rights reserved.
//

#import "BundleAudio3Controller.h"
#import <UIKit/UIKit.h>
#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>

@implementation BundleAudio3Controller

WKAudioFilePlayer * audioFilePlayer3 = nil;

- (instancetype)init {
    self = [super init];
    
    NSBundle * mainBundle = [NSBundle mainBundle];
    NSURL * fileURL = [mainBundle URLForResource:@"MediaFiles/aif" withExtension: @"aif"];
    
    
    if(fileURL != nil){
        WKAudioFileAsset * asset = [WKAudioFileAsset assetWithURL: fileURL ];
        
        WKAudioFilePlayerItem * audioFileItem = [WKAudioFilePlayerItem playerItemWithAsset: asset];
        
        NSLog(@"%@", audioFileItem);
        
        audioFilePlayer3 = [WKAudioFilePlayer playerWithPlayerItem: audioFileItem];
        
        NSTimeInterval interval = [audioFilePlayer3 currentTime];
        WKAudioFilePlayerStatus status = [audioFilePlayer3 status];
        NSError * error = [audioFilePlayer3 error];
        float rate = [audioFilePlayer3 rate];
        WKAudioFilePlayerItem * item = [audioFilePlayer3 currentItem];
        
        // Gets the 3 statuses in a WKAudioFilePlayerItem
        NSInteger status_1 = WKAudioFilePlayerStatusUnknown;
        NSInteger status_2 = WKAudioFilePlayerStatusReadyToPlay;
        NSInteger status_3 = WKAudioFilePlayerStatusFailed;
        
        NSLog(@"Our 3 WKAudioFilePlayerStatuses are: \n");
        NSLog(@"WKAudioFilePlayerStatusUnknown: %ld\n", (long)status_1);
        NSLog(@"WKAudioFilePlayerStatusReadyToPlay: %ld\n", (long)status_2);
        NSLog(@"WKAudioFilePlayerStatusFailed: %ld\n", (long)status_3);
        
        // Logs all the properties in WKAudioFilePlayer
        NSLog(@"Current Time is: %f\n", interval);
        NSLog(@"Current Status is: %ld\n", (long)status);
        NSLog(@"Current Error is: %@\n", error);
        NSLog(@"Current Rate is: %f\n", rate);
        NSLog(@"Current Item is: %@\n", item);
    }
    else{
        NSLog(@"BundleAudio3Controller: File URL is nil");
    }
    return self;
}


- (IBAction)Start {
    NSLog(@"In Start");
    [audioFilePlayer3 play];
    
    // pauses the Audio File after 2 seconds
    [audioFilePlayer3 performSelector: @selector(pause) withObject:nil afterDelay:2.0];
    
    [self ReplaceNewPlayerItem];
    
    [audioFilePlayer3 play];
}

- (void)ReplaceNewPlayerItem{
    NSLog(@"In Replace");
    NSBundle * mainBundle = [NSBundle mainBundle];
    NSURL * fileURL = [mainBundle URLForResource:@"MediaFiles/Death Grips - Get Got" withExtension: @"mp3"];
    
    WKAudioFileAsset * asset = [WKAudioFileAsset assetWithURL: fileURL ];
    
    WKAudioFilePlayerItem * audioFileItem = [WKAudioFilePlayerItem playerItemWithAsset: asset];
    
    [audioFilePlayer3 replaceCurrentItemWithPlayerItem: audioFileItem];
}



@end
