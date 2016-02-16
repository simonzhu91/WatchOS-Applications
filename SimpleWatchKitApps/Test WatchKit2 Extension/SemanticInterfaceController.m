//
//  SemanticInterfaceController.m
//  SimpleWatchKitApps
//
//  Created by Simon Zhu on 11/1/15.
//  Copyright © 2015 Simon Zhu. All rights reserved.
//

#import "SemanticInterfaceController.h"

@interface SemanticInterfaceController ()

@end

@implementation SemanticInterfaceController

@synthesize label;
@synthesize switchRef;
@synthesize movie;

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    // Configure interface objects here.
    NSString *resource = [[NSBundle mainBundle] pathForResource:@"Test_video-480p" ofType:@"mov"];
    
    [movie setMovieURL:[NSURL fileURLWithPath: resource]];
    [movie setLoops:YES];

}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

- (IBAction)setUnspecified {
    [switchRef setSemanticContentAttribute: WKInterfaceSemanticContentAttributeUnspecified];
}

- (IBAction)setPlayback {
    [movie setSemanticContentAttribute: WKInterfaceSemanticContentAttributePlayback];
}

- (IBAction)setSpatial {
    [switchRef setSemanticContentAttribute: WKInterfaceSemanticContentAttributeSpatial];
}


- (IBAction)setRightToLeft {
    [switchRef setSemanticContentAttribute: WKInterfaceSemanticContentAttributeForceRightToLeft];
    [movie setSemanticContentAttribute: WKInterfaceSemanticContentAttributeForceRightToLeft];
}


- (IBAction)setLeftToRight {
    [switchRef setSemanticContentAttribute: WKInterfaceSemanticContentAttributeForceLeftToRight];
    [movie setSemanticContentAttribute: WKInterfaceSemanticContentAttributeForceLeftToRight];
}

- (IBAction)getDirection {
    
    // Tells us the direction of the Watch Layout for each Enum
    NSLog(@"Layout Direction for Unspecified Setting: %d", [WKInterfaceDevice interfaceLayoutDirectionForSemanticContentAttribute: WKInterfaceSemanticContentAttributeUnspecified]);
    
    NSLog(@"Layout Direction for Playback Setting: %d",[WKInterfaceDevice interfaceLayoutDirectionForSemanticContentAttribute: WKInterfaceSemanticContentAttributePlayback]);
    
    NSLog(@"Layout Direction for Spatial Setting: %d", [WKInterfaceDevice interfaceLayoutDirectionForSemanticContentAttribute: WKInterfaceSemanticContentAttributeSpatial]);
    
    NSLog(@"Layout Direction for Left to Right Setting: %d", [WKInterfaceDevice interfaceLayoutDirectionForSemanticContentAttribute: WKInterfaceSemanticContentAttributeForceLeftToRight]);
    
    NSLog(@"Layout Direction for Right to Left Setting: %d", [WKInterfaceDevice interfaceLayoutDirectionForSemanticContentAttribute: WKInterfaceSemanticContentAttributeForceRightToLeft]);
    
    
    // Tells us the direction of the Watch Layout for a specific device
    WKInterfaceDevice * curr = [WKInterfaceDevice currentDevice];
    
    NSLog(@"Layout Direction for Current Device: %d", [curr layoutDirection]);
    
    
}


@end



