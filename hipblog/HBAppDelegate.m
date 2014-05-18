//
//  HBAppDelegate.m
//  hipblog
//
//  Created by Jan Schulte on 07/05/14.
//  Copyright (c) 2014 schultyy. All rights reserved.
//

#import "HBAppDelegate.h"

@implementation HBAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
}

-(IBAction) openDirectory:(id)sender {
    HBMainController *doc = [[HBMainController alloc] init];
    [doc openBlogpost];
    [doc showWindow:self];
    [self setMainController:doc];
}

-(IBAction) createNewBlogpost: (id) sender {
    HBMainController *newDoc = [[HBMainController alloc] init];
    [newDoc newBlogpost];
    [newDoc showWindow:self];
    [self setMainController:newDoc];
}

-(IBAction) saveBlogpost:(id)sender{
    [[self mainController] saveCurrentPost];
}

@end
