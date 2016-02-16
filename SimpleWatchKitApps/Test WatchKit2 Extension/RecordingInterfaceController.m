//
//  InterfaceController.m
//  MediaTester WatchKit2 Extension
//
//  Created by Jonathan Long on 5/12/15.
//  Copyright © 2015 Jonathan Long. All rights reserved.
//

#import "RecordingInterfaceController.h"


@interface RecordingInterfaceController()
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *sliderDurationLabel;
@property NSUInteger numberOfRecordings;
@property NSURL *lastRecordingURL;
@end


@implementation RecordingInterfaceController

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

- (IBAction)wavNarrowBand {
    [self pushAudioRecordingControllerWithPreset:WKAudioRecorderPresetNarrowBandSpeech andFileType:@"wav"];
}
- (IBAction)wavWideBand {
    [self pushAudioRecordingControllerWithPreset:WKAudioRecorderPresetWideBandSpeech andFileType:@"wav"];
}
- (IBAction)wavHighQuality {
    [self pushAudioRecordingControllerWithPreset:WKAudioRecorderPresetHighQualityAudio andFileType:@"wav"];
}
- (IBAction)mp4NarrowBand {
    [self pushAudioRecordingControllerWithPreset:WKAudioRecorderPresetNarrowBandSpeech andFileType:@"mp4"];
}
- (IBAction)mp4WideBand {
    [self pushAudioRecordingControllerWithPreset:WKAudioRecorderPresetWideBandSpeech andFileType:@"mp4"];
}
- (IBAction)mp4HighQuality {
    [self pushAudioRecordingControllerWithPreset:WKAudioRecorderPresetHighQualityAudio andFileType:@"mp4"];
}
- (IBAction)m4aNarrowBand {
    [self pushAudioRecordingControllerWithPreset:WKAudioRecorderPresetNarrowBandSpeech andFileType:@"m4a"];
}
- (IBAction)m4aWideBand {
    [self pushAudioRecordingControllerWithPreset:WKAudioRecorderPresetWideBandSpeech andFileType:@"m4a"];
}
- (IBAction)m4aHighQuality {
    [self pushAudioRecordingControllerWithPreset:WKAudioRecorderPresetHighQualityAudio andFileType:@"m4a"];
}

- (IBAction)playbackLastRecording {
    NSLog(@"*******Playback!!!");
    NSURL *url = _lastRecordingURL;
    [self presentMediaPlayerControllerWithURL:url options:@{WKMediaPlayerControllerOptionsAutoplayKey : @YES} completion:^(BOOL didPlayToEnd, NSTimeInterval time, NSError * error) {
        if (didPlayToEnd) {
            NSLog(@"Did Play to end");
        } else {
            NSLog(@"Did not play to end");
        }
        
    }];
}

- (IBAction)sliderSlide:(float)value {
    [self.sliderDurationLabel setText:[NSString stringWithFormat:@"Max Rec Dur: %f", value]];
    
}


- (void)pushAudioRecordingControllerWithPreset:(WKAudioRecorderPreset)preset andFileType:(NSString *)type{
    NSLog(@"*******RECORDING!!!");
    
    //__block NSURL * url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/AudioRecording-%lu.%@", NSTemporaryDirectory(), (unsigned long)self.numberOfRecordings, type]];
    __weak RecordingInterfaceController *welf = self;
    
    NSString *const AAPLAppConfigurationApplicationGroupsPrimary = @"group.apple.SimpleWatchKitApps";
    NSFileManager *manager = [NSFileManager defaultManager];
    NSURL * directory = [manager containerURLForSecurityApplicationGroupIdentifier:AAPLAppConfigurationApplicationGroupsPrimary];
    
    NSUInteger timeAtRecording = (NSUInteger)[NSDate timeIntervalSinceReferenceDate];
    
    __block NSString *recordingName = [NSString stringWithFormat:@"AudioRecording-%d.mp4", timeAtRecording];
    
    __block NSURL * outputURL = [directory URLByAppendingPathComponent:recordingName];
    
    if(outputURL == nil){
        NSLog(@"Error: outputURL is nil");
        NSLog(@"WatchKitRecordingFailedError: %d", WatchKitRecordingFailedError);
    }
    
    NSLog(@"%@",outputURL);
    
    [self presentAudioRecorderControllerWithOutputURL:outputURL preset:preset options:nil completion:^(BOOL didSave, NSError * error) {
        if (didSave) {
            self.lastRecordingURL = outputURL;
            NSLog(@"Saved Recording to URL: %@", outputURL);
            welf.numberOfRecordings++;
        } else {
            NSLog(@"There was an error: %@", error);
            NSLog(@"WatchKitRecordingFailedError: %d", WatchKitRecordingFailedError);
        }
    }];
}




@end



