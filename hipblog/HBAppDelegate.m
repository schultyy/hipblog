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
    HBMainController *controller = [[HBMainController alloc] init];
    [self setMainController:controller];
}

-(IBAction) openDirectory:(id)sender {

    [self.mainController openBlogpost];
    [self.mainController showWindow:self];
}

-(IBAction) createNewBlogpost: (id) sender {

    [self.mainController newBlogpost];
    [self.mainController showWindow:self];
}

-(IBAction) saveBlogpost:(id)sender{
    [[self mainController] saveCurrentPost];
}

@end
