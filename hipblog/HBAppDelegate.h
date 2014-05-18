//
//  HBAppDelegate.h
//  hipblog
//
//  Created by Jan Schulte on 07/05/14.
//  Copyright (c) 2014 schultyy. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "HBMainController.h"

@interface HBAppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;

@property (retain) HBMainController *mainController;

-(IBAction) openDirectory:(id)sender;

-(IBAction) createNewBlogpost: (id) sender;

-(IBAction)saveBlogpost:(id)sender;

@end
