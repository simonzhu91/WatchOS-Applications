//
//  AlertController.h
//  SimpleWatchKitApps
//
//  Created by Simon Zhu on 6/17/15.
//  Copyright © 2015 Simon Zhu. All rights reserved.
//

#import <WatchKit/WatchKit.h>

@interface AlertController : WKInterfaceController

      @property(nonatomic,weak)IBOutlet WKInterfaceLabel * label;
        @property(nonatomic,copy) void(^activateAction)(void);

@end
