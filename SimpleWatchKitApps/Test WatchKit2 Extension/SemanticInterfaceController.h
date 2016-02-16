//
//  SemanticInterfaceController.h
//  SimpleWatchKitApps
//
//  Created by Simon Zhu on 11/1/15.
//  Copyright © 2015 Simon Zhu. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>

@interface SemanticInterfaceController : WKInterfaceController
@property (strong, nonatomic) IBOutlet WKInterfaceLabel *label;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceSwitch *switchRef;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceMovie *movie;

@end
