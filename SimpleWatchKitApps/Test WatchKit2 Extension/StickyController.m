//
//  InterfaceController.m
//  StickyTestApp WatchKit2 Extension
//
//  Created by Chloe Chang on 4/21/15.
//  Copyright © 2015 Apple. All rights reserved.
//

#import "InterfaceController.h"
#import <WatchKit/WKExtension.h>
#import <UIKit/UIKit.h>

@interface Session : NSObject
//@property (nonatomic) WKPersistentSessionIdentifier stickyID;
@end

@implementation Session
@end

@interface StickyController : WKInterfaceController
@property (nonatomic) NSMutableArray * sessions;
@end

// **** Note:
// Contents of startSession and endSession are commented out since Sticky Apps have been removed for the current version of Bondi

@implementation StickyController : WKInterfaceController

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


- (IBAction)startSession {
    /*
    Session *newSession = [Session new];
    if (!self.sessions) {
        self.sessions = [NSMutableArray new];
    }
    
    NSLog(@"Try starting sticky session...");
    __weak InterfaceController *weakSelf = self;
    __weak Session *weakSession = newSession;
    WKPersistentSessionIdentifier sessionID = [[WKExtension sharedExtension] beginPersistentSessionWithExpirationHandler:^(void){
        NSLog(@"Sticky Session Ended - id=%lu", (unsigned long)[weakSession stickyID]);
        NSMutableArray *array = [weakSelf sessions];
        [array removeObject:weakSession];
    }];
    
    [newSession setStickyID:sessionID];
    [self.sessions addObject:newSession];
    
    NSLog(@"Sticky Session Started - id=%lu", (unsigned long)sessionID);
     */
}

// Starts a session and interrupts after 5 seconds with a notification
- (IBAction) interruptSessionAfter5Seconds {
    [self startSession];
    
    NSTimeInterval delay = 5;
    
    // dispatches an alert after 5 seconds to stop app from being sticky
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, delay * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        [self alert];
    });
}

// launches an alert
- (void) alert{
    

    UILocalNotification *notif = [[UILocalNotification alloc] init];
    
    if (notif) {
        notif.timeZone = [NSTimeZone defaultTimeZone];
        notif.repeatInterval = 0;
        notif.alertTitle = @"Title";
        notif.alertBody = @"Body";
    }
    
}

- (IBAction)endSession {
    /*
    if ([self.sessions count] > 0) {
        WKPersistentSessionIdentifier sessionID = [self.sessions[0] stickyID];
        if (sessionID != WKPersistentSessionInvalid) {
            NSLog(@"Try ending sticky session - id=%luu",(unsigned long) (unsigned long)sessionID);
            [[WKExtension sharedExtension] endPersistentSession:sessionID];
        }
    }*/
}

@end



