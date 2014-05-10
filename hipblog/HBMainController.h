//
//  HBMainController.h
//  hipblog
//
//  Created by Jan Schulte on 07/05/14.
//  Copyright (c) 2014 schultyy. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "HBEditorViewController.h"

@interface HBMainController : NSWindowController {

    NSURL *directoryUrl;
}

@property IBOutlet NSBox *editorView;

@property (retain) HBEditorViewController *editorController;

- (id)initWitDirectoryPath: (NSURL *) url;

@end
