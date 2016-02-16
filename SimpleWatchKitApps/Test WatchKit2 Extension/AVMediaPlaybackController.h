//
//  AVMediaPlaybackController.h
//  MediaTester
//
//  Created by Jonathan Long on 5/13/15.
//  Copyright © 2015 Jonathan Long. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WatchKit/WKInterfaceMovie.h>

@interface AVMediaPlaybackController : NSObject
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceMovie *movie;

@end
