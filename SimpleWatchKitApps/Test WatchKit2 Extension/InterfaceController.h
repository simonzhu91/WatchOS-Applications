//
//  InterfaceController.h
//  Test WatchKit2 Extension
//
//  Created by Simon Zhu on 5/15/15.
//  Copyright © 2015 Simon Zhu. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>

@interface InterfaceController : WKInterfaceController

    @property(nonatomic,weak)IBOutlet WKInterfaceImage * image;

@end
