//
//  BundleAudioController3.m
//  SimpleWatchKitApps
//
//  Created by Simon Zhu on 9/9/15.
//  Copyright © 2015 Simon Zhu. All rights reserved.
//

#import "RemoteAudio2Controller.h"
#import <UIKit/UIKit.h>
#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>

@implementation RemoteAudio2Controller


- (IBAction)Start {
    
    NSLog(@"Hello");
    
    // NSBundle * mainBundle = [NSBundle mainBundle];
    NSURL *fileURL = [NSURL URLWithString:@"https://dl.dropboxusercontent.com/s/vcex0ljq51xxjei/TestMusic.m4a"];
    
    if(fileURL != nil){
        
        NSLog(@"File URL is not nil");
        
        NSString * title = @"Test Music";
        NSString * albumTitle = @"Album Title";
        NSString * artist = @"Artist";
        
        WKAudioFileAsset * asset = [WKAudioFileAsset assetWithURL:fileURL title: title albumTitle:albumTitle artist:artist];
        
        NSTimeInterval duration = [asset duration];
        
        WKAudioFilePlayerItem * audioFileItem = [WKAudioFilePlayerItem playerItemWithAsset: asset];
        
        WKAudioFilePlayer * audioFilePlayer = [WKAudioFilePlayer playerWithPlayerItem: audioFileItem];
        
        NSTimeInterval interval = [audioFilePlayer currentTime];
        WKAudioFileAsset * read_asset = [audioFileItem asset];
        WKAudioFilePlayerItemStatus status = [audioFileItem status];
        NSError * error = [audioFileItem error];
        NSTimeInterval currentTime = [audioFileItem currentTime];
        
        // Logs all the properties in WKAudioFileAsset, WKAudioFilePlayerItem, WKAudioFilePlayer
        
        // Logs the properties in WKAudioFileAsset
        NSLog(@"WKAudioFileAsset URL: %@", [asset URL]);
        NSLog(@"WKAudioFileAsset duration: %f", [asset duration]);
        NSLog(@"WKAudioFileAsset Title: %@", [asset title]);
        NSLog(@"WKAudioFileAsset Album Title: %@", [asset albumTitle]);
        NSLog(@"WKAudioFileAsset Artist: %@", [asset artist]);
        
        // Logs the properties in WKAudioFilePlayerItemStatus
        NSLog(@"WKAudioFilePlayerItem Interval: %f", interval);
        NSLog(@"WKAudioFilePlayerItem Read Asset: %@", read_asset);
        NSLog(@"WKAudioFilePlayerItem Stats: %ld", (long)status);
        NSLog(@"WKAudioFilePlayerItem Error: %@", error);
        NSLog(@"WKAudioFilePlayerItem Current Time: %f", currentTime);
        
        // Logs the Extern String Notification Constants in WKAudioFileAsset
        NSLog(@"WKAudioFilePlayerItemTimeJumpedNotification: %@", WKAudioFilePlayerItemTimeJumpedNotification);
        NSLog(@"WKAudioFilePlayerItemDidPlayToEndTimeNotification: %@", WKAudioFilePlayerItemDidPlayToEndTimeNotification);
         NSLog(@"WKAudioFilePlayerItemFailedToPlayToEndTimeNotification: %@", WKAudioFilePlayerItemFailedToPlayToEndTimeNotification);
        
        // Logs the properties in WKAudioFilePlayer
        NSLog(@"The Current Time Interval for the Audio File Player is: %f", interval);
        NSLog(@"The Title for the Audio File Asset is: %@", title);
        NSLog(@"The Album Title for the Audio File Asset is: %@", albumTitle);
        NSLog(@"The Artist for the Audio File Asset is: %@", artist);
        NSLog(@"The Duration for the Audio File Asset is: %f", duration);
        
        [audioFilePlayer play];
    }
    else{
        NSLog(@"Error: Path to Audio Asset is nil");
        NSLog(@"WatchKitMediaPlayerError: %d", WatchKitMediaPlayerError);
    }

}


@end
