//
//  WKAudioFileQueuePlayerControllerInterfaceController.m
//  SimpleWatchKitApps
//
//  Created by Simon Zhu on 9/24/15.
//  Copyright © 2015 Simon Zhu. All rights reserved.
//

#import "WKAudioFileQueuePlayerControllerInterfaceController.h"

@interface WKAudioFileQueuePlayerControllerInterfaceController ()

@end

@implementation WKAudioFileQueuePlayerControllerInterfaceController

    WKAudioFileQueuePlayer * queuePlayer;
    NSMutableArray * queueArray;
    WKAudioFilePlayerItem * item1;
    WKAudioFilePlayerItem * item2;

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    // Configure interface objects here.
    if (queueArray == nil)
    {
        queueArray = [[NSMutableArray alloc] init];
    }
    
    if (queuePlayer == nil)
    {
        NSBundle * mainBundle = [NSBundle mainBundle];
    
        NSURL * file1URL = [mainBundle URLForResource:@"MediaFiles/aif" withExtension: @"aif"];
        NSURL * file2URL = [mainBundle URLForResource:@"MediaFiles/Death Grips - Get Got" withExtension: @"mp3"];
    
        if(file1URL != nil && file2URL != nil){
        
            WKAudioFileAsset * asset1 = [WKAudioFileAsset assetWithURL: file1URL ];
            WKAudioFileAsset * asset2 = [WKAudioFileAsset assetWithURL: file2URL ];
        
            item1 = [WKAudioFilePlayerItem playerItemWithAsset: asset1];
            item2 = [WKAudioFilePlayerItem playerItemWithAsset: asset2];
        
            NSLog(@"%@", item1);
            NSLog(@"%@", item2);
        
            NSArray * temp = [NSArray arrayWithObjects: item1,item2,nil];
        
            NSLog(@"Before call to QueuePlayerWithItems.");
        
            queuePlayer = [WKAudioFileQueuePlayer queuePlayerWithItems: temp];
            [queuePlayer play];
        }
    }

}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
    
}

// Adds Aif or Death Grips to our queuePlayer
- (IBAction) appendAif {
    
    if(item1 != nil){
        [queuePlayer appendItem: item1];
    }
}

- (IBAction) appendDeathGrips {
    if(item2 != nil){
        [queuePlayer appendItem: item2];
    }
}


// Removes Aif or Death Grips from our queuePlayer
- (IBAction) removeAif {
    if(item1 != nil && [[queuePlayer items]containsObject:item1]){
        [queuePlayer removeItem: item1];
    }
}

- (IBAction) removeDeathGrips {
    if(item2 != nil && [[queuePlayer items]containsObject:item2]){
        [queuePlayer removeItem: item2];
    }
}

// Removes all items
- (IBAction) removeAll {
    [queuePlayer removeAllItems];
}

// Advances to the next item
- (IBAction) nextItem {
    NSLog(@"Current Item is: ");
    NSLog(@"%@",[queuePlayer currentItem]);
    [queuePlayer advanceToNextItem];
    NSLog(@"Moving to Next Item: ");
    NSLog(@"%@",[queuePlayer currentItem]);
}

// Shows all the contents of the NSArray
- (IBAction) showAllItems {
    NSLog(@"In Show All");
    NSArray * arr = [queuePlayer items];
    
    for(int i = 0; i < [arr count]; i++){
        NSLog(@"Current Item is: %@", arr[i]);
    }
}


- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
    
    
}

@end



