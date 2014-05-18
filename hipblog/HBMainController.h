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

@interface HBMainController : NSWindowController

@property IBOutlet NSBox *editorView;

@property (retain) HBEditorViewController *editorController;

-(void) newBlogpost;

-(void) saveCurrentPost;

@end
