//
//  AVPlayBackInterfaceController.m
//  MediaTester
//
//  Created by Jonathan Long on 5/13/15.
//  Copyright © 2015 Jonathan Long. All rights reserved.
//

#import "AVPlayBackInterfaceController.h"
#import "AVMediaPlaybackController.h"
@interface AVPlayBackInterfaceController ()
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceTable *playbackTable;
@property (strong, nonatomic) NSArray<NSURL *> *elementsList;
@end

@implementation AVPlayBackInterfaceController

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

- (instancetype)init {
    self = [super init];
    
    if (self) {
        NSURL *hlsURL = [NSURL URLWithString:@""];
        NSURL *local3gpURL = [[NSBundle mainBundle] URLForResource:@"3gp" withExtension:@"3gp"];
        NSURL *localSloURL = [[NSBundle mainBundle] URLForResource:@"120fps" withExtension:@"mp4"];
        NSURL *localaifURL = [[NSBundle mainBundle] URLForResource:@"aif" withExtension:@"aif"];
        NSURL *localiPhoneURL = [[NSBundle mainBundle] URLForResource:@"iphone" withExtension:@"mov"];
        NSURL *localM4aURL = [[NSBundle mainBundle] URLForResource:@"m4a" withExtension:@"m4a"];
        NSURL *localM4vURL = [[NSBundle mainBundle] URLForResource:@"m4v" withExtension:@"m4v"];
        NSURL *localmp3 = [[NSBundle mainBundle] URLForResource:@"mp3" withExtension:@"mp3"];
        NSURL *localMovURL = [[NSBundle mainBundle] URLForResource:@"qtmovie" withExtension:@"mov"];
        self.elementsList = @[
                              hlsURL,
                              local3gpURL,
                              localSloURL,
                              localaifURL,
                              localiPhoneURL,
                              localM4aURL,
                              localM4vURL,
                              localmp3,
                              localMovURL
                              ];
        
        NSLog(@"Calling Load TableRows");
        [self loadTableRows];
    }
    
    return self;
}

- (void)loadTableRows {
    [self.playbackTable setNumberOfRows:self.elementsList.count withRowType:@"default"];
    
    // Create all of the table rows.
    [self.elementsList enumerateObjectsUsingBlock:^(NSURL *url, NSUInteger idx, BOOL *stop) {
        AVMediaPlaybackController *elementRow = [self.playbackTable rowControllerAtIndex:idx];
        if (idx % 3 == 0) {
            [elementRow.movie setVideoGravity:WKVideoGravityResize];
        } else if (idx % 3 == 1) {
            [elementRow.movie setVideoGravity:WKVideoGravityResizeAspect];
        } else {
            [elementRow.movie setVideoGravity:WKVideoGravityResizeAspectFill];
        }
//        [elementRow.movie setPosterImage:[WKImage imageWithImageData:[NSData dataWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"ImageResource" withExtension:@"png"]]]];
        
        NSLog(@"Enumerating rows");
        [elementRow.movie setMovieURL:url];
    }];
}
@end



