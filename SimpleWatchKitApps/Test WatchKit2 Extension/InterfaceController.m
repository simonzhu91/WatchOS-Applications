//
//  InterfaceController.m
//  Test WatchKit2 Extension
//
//  Created by Simon Zhu on 5/15/15.
//  Copyright © 2015 Simon Zhu. All rights reserved.
//

#import "InterfaceController.h"
#import <UIKit/UIKit.h>

@interface InterfaceController()

@end

@implementation InterfaceController

@synthesize image;

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

// Testing: playHaptic
- (IBAction)testHepticButtonClick {
    WKInterfaceDevice * device = [WKInterfaceDevice currentDevice];
    
    WKAlertAction *note = [WKAlertAction actionWithTitle:@"Notification" style:WKAlertActionStyleDefault handler:^{
        [device playHaptic:WKHapticTypeNotification];
    }];
    WKAlertAction *dirUp = [WKAlertAction actionWithTitle:@"DirectionUp" style:WKAlertActionStyleDefault handler:^{
        [device playHaptic:WKHapticTypeDirectionUp];
    }];
    WKAlertAction *dirDown = [WKAlertAction actionWithTitle:@"DirectionDown" style:WKAlertActionStyleDefault handler:^{
        [device playHaptic:WKHapticTypeDirectionDown];
    }];
    WKAlertAction *suc = [WKAlertAction actionWithTitle:@"Success" style:WKAlertActionStyleDefault handler:^{
        [device playHaptic:WKHapticTypeSuccess];
    }];
    WKAlertAction *fail = [WKAlertAction actionWithTitle:@"Failure" style:WKAlertActionStyleDefault handler:^{
        [device playHaptic:WKHapticTypeFailure];
    }];
    WKAlertAction *retry = [WKAlertAction actionWithTitle:@"Retry" style:WKAlertActionStyleDefault handler:^{
        [device playHaptic:WKHapticTypeRetry];
    }];
    WKAlertAction *start = [WKAlertAction actionWithTitle:@"Start" style:WKAlertActionStyleDefault handler:^{
        [device playHaptic:WKHapticTypeStart];
    }];
    WKAlertAction *stop = [WKAlertAction actionWithTitle:@"Stop" style:WKAlertActionStyleDefault handler:^{
        [device playHaptic:WKHapticTypeStop];
    }];
    WKAlertAction *click = [WKAlertAction actionWithTitle:@"Click" style:WKAlertActionStyleDefault handler:^{
        [device playHaptic:WKHapticTypeClick];
    }];
    
    [self presentAlertControllerWithTitle:@"Haptics" message:@"Choose one" preferredStyle:WKAlertControllerStyleActionSheet actions:@[note,dirUp,dirDown,suc,fail,retry,start,stop,click]];
}


@end



