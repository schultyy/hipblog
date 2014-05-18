//
//  HBMainController.m
//  hipblog
//
//  Created by Jan Schulte on 07/05/14.
//  Copyright (c) 2014 schultyy. All rights reserved.
//

#import "HBMainController.h"
#import "HBEditorViewController.h"
#import "HBPost.h"
#import "HBPostWriter.h"

@interface HBMainController ()

@end

@implementation HBMainController

- (id)init
{
    self = [super initWithWindowNibName:@"HBMainWindow"];
    if (self) {
        id editor = [[HBEditorViewController alloc] init];
        [self setEditorController: editor];
    }
    return self;
}

-(void)awakeFromNib {
    [super awakeFromNib];
    [[self editorView] setContentView: self.editorController.view];
    [[self window] setTitle: @"New blogpost"];
}

-(void)newBlogpost {
    [[self editorController] setCurrentPost:[[HBPost alloc] init]];
}

-(void)saveCurrentPost {

    HBPost *currentPost = [[self editorController] currentPost];

    NSSavePanel *savePanel = [[NSSavePanel alloc] init];

    [savePanel setCanCreateDirectories:YES];

    [savePanel setAllowedFileTypes:[NSArray arrayWithObject:@"md"]];

    [savePanel setNameFieldStringValue:currentPost.filename];

    if([savePanel runModal] == NSOKButton) {
        [HBPostWriter writeToFile:[savePanel URL].path post:currentPost];
    }
}

@end
