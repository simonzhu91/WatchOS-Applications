//
//  AVPlayBackPresenterInterfaceController.m
//  MediaTester
//
//  Created by Jonathan Long on 5/13/15.
//  Copyright © 2015 Jonathan Long. All rights reserved.
//

#import "AVPlayBackPresenterInterfaceController.h"

@interface AVPlayBackPresenterInterfaceController ()
@property NSTimeInterval currentValue;
@end

@implementation AVPlayBackPresenterInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (IBAction)sliderDidSlide:(float)value {
    self.currentValue = value;
}

- (IBAction)localPlaybackTapped {
    NSURL *localURL = [[NSBundle mainBundle] URLForResource:@"local" withExtension:@"mov"];
    NSDictionary *options = @{WKMediaPlayerControllerOptionsStartTimeKey : @(self.currentValue)};
    [self presentPlaybackControllerWithURL:localURL andOptions:options];
}

- (IBAction)streamingPlaybackTapped {
    NSURL *streamingURL = [NSURL URLWithString:@"Some http://"];
    NSDictionary *options = @{WKMediaPlayerControllerOptionsStartTimeKey : @(self.currentValue)};
    [self presentPlaybackControllerWithURL:streamingURL andOptions:options];
}

- (IBAction)audioOnlyPlaybackTapped {
    NSURL *audioOnlyURL = [[NSBundle mainBundle] URLForResource:@"AudioResource" withExtension:@"m4a"];
    NSDictionary *options = @{WKMediaPlayerControllerOptionsStartTimeKey : @(self.currentValue)};
    [self presentPlaybackControllerWithURL:audioOnlyURL andOptions:options];
}

- (IBAction)videoAutoPlayTapped {
    NSURL *streamingURL = [NSURL URLWithString:@"Some http://"];
    NSDictionary *options = @{WKMediaPlayerControllerOptionsAutoplayKey : @(YES),
                              WKMediaPlayerControllerOptionsStartTimeKey : @(self.currentValue)};
    [self presentPlaybackControllerWithURL:streamingURL andOptions:options];
}

- (IBAction)audioAutoPlayTapped {
    NSURL *audioOnlyURL = [[NSBundle mainBundle] URLForResource:@"AudioResource" withExtension:@"m4a"];
    NSDictionary *options = @{WKMediaPlayerControllerOptionsAutoplayKey : @(YES),
                              WKMediaPlayerControllerOptionsStartTimeKey : @(self.currentValue)};
    [self presentPlaybackControllerWithURL:audioOnlyURL andOptions:options];
}

- (void)presentPlaybackControllerWithURL:(NSURL *)url andOptions:(NSDictionary *)options {
    [self presentMediaPlayerControllerWithURL:url options:options completion:^(BOOL didPlayToEnd, NSTimeInterval endTime, NSError * __nullable error) {
        NSLog(@"EndTime: %f", endTime);
        if (didPlayToEnd) {
            NSLog(@"Player Did play to end");
        }
        if (error) {
            NSLog(@"There was an error with playback: %@", error);
        }
    }];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

@end



