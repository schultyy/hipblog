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
#import "HBPostReader.h"
#import "HBFrontMatter.h"

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

-(void) openBlogpost {
    NSOpenPanel* openDlg = [NSOpenPanel openPanel];

    [openDlg setAllowsMultipleSelection:NO];
    [openDlg setCanChooseDirectories:NO];
    [openDlg setCanChooseFiles:YES];

    if([openDlg runModal] == NSOKButton)
    {
        NSURL *url = [openDlg URL];

        HBPost *currentPost = [HBPostReader readPost: url.path];
        [[self editorController] setCurrentPost:currentPost];
        [[self window] setTitle: currentPost.frontMatter.title];
    }
}

-(void)saveCurrentPost {

    HBPost *currentPost = [[self editorController] currentPost];

    if([currentPost filepath]) {
        [HBPostWriter writeToFile:[currentPost filepath] post: currentPost];
        [[self window] setTitle: currentPost.frontMatter.title];
    }
    else {
        NSSavePanel *savePanel = [[NSSavePanel alloc] init];

        [savePanel setCanCreateDirectories: NO];
        [savePanel setAllowedFileTypes:[NSArray arrayWithObject:@"md"]];
        [savePanel setNameFieldStringValue:currentPost.filename];

        if([savePanel runModal] == NSOKButton) {
            [currentPost setFilepath: [savePanel URL].path];
            [HBPostWriter writeToFile:[savePanel URL].path post:currentPost];
            [[self window] setTitle: currentPost.frontMatter.title];
        }
    }
}

@end
