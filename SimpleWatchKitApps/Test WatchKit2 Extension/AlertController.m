//
//  AlertController.m
//  SimpleWatchKitApps
//
//  Created by Simon Zhu on 6/17/15.
//  Copyright © 2015 Simon Zhu. All rights reserved.
//

#import "AlertController.h"
#import <WatchKit/WatchKit.h>
#import <UIKit/UIKit.h>

@implementation AlertController

@synthesize label;

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    if (_activateAction != nil) {
        _activateAction();
        _activateAction = nil;
    }
    [super willActivate];
}

// Testing: WKAlertAction
- (IBAction)testAlertButtonClick {
    
    NSLog(@"Hello");
    
    WKAlertAction * normal = [WKAlertAction actionWithTitle:@"Green" style:WKAlertActionStyleDefault handler:^{
        __weak WKInterfaceLabel *label_ = label;
        _activateAction = ^ {
            [label_ setText: @"Green"];
            [label_ setTextColor: [UIColor greenColor]];
            NSLog(@"Changing Color 1");
        };
    }];
    
    
    WKAlertAction * destructive = [WKAlertAction actionWithTitle:@"Blue" style:WKAlertActionStyleDestructive handler:^{
        __weak WKInterfaceLabel *label_ = label;
        _activateAction = ^ {
            [label_ setText: @"Blue"];
            [label_ setTextColor: [UIColor blueColor]];
            NSLog(@"Changing Color 2");
        };
    }];
    
    WKAlertAction * cancel = [WKAlertAction actionWithTitle:@"Purple" style:WKAlertActionStyleCancel handler:^{
        __weak WKInterfaceLabel *label_ = label;
        _activateAction = ^ {
            [label_ setText: @"Purple"];
            [label_ setTextColor: [UIColor purpleColor]];
            NSLog(@"Changing Color 3");
        };
    }];
    
    NSString * val = nil;
    
    WKAlertAction * none = [WKAlertAction actionWithTitle:val style:WKAlertActionStyleCancel handler:^{
        
    }];
    
    [self presentAlertControllerWithTitle: @"Test Alert" message:@"Hello" preferredStyle:WKAlertControllerStyleAlert actions: @[normal, destructive, none, cancel]];
}



@end
