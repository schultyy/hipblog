//
//  HBMainController.h
//  hipblog
//
//  Created by Jan Schulte on 07/05/14.
//  Copyright (c) 2014 schultyy. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "HBEditorViewController.h"

@class HBFileListViewController;

@interface HBMainController : NSWindowController {
    NSURL *directoryUrl;
}

@property IBOutlet NSBox *editorView;

@property IBOutlet NSBox *fileListView;

@property (retain) HBEditorViewController *editorController;

@property (retain) HBFileListViewController *fileListController;

- (id)initWitDirectoryPath: (NSURL *) url;

-(void) saveCurrentPost;

@end
