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
    NSOpenPanel* openDlg = [NSOpenPanel openPanel];
    
    [openDlg setCanChooseFiles:YES];
    [openDlg setAllowsMultipleSelection:NO];
    [openDlg setCanChooseDirectories:YES];
    [openDlg setCanChooseFiles:NO];

    if([openDlg runModal] == NSOKButton)
    {
        id url = [openDlg directoryURL];
        NSLog(@"URL: %@", url);

        HBMainController *controller = [[HBMainController alloc] initWitDirectoryPath: url];
        [self setMainController:controller];
        [[self mainController] showWindow:self];
    }
}

-(IBAction) saveBlogpost:(id)sender{
    [[self mainController] saveCurrentPost];
}

-(BOOL) canSaveBlogpost {
    return [self mainController] != nil;
}

@end
