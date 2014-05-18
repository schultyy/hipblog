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
#import "HBFileListViewController.h"

@interface HBMainController ()

@end

@implementation HBMainController

- (id)initWitDirectoryPath: (NSURL *) url
{
    self = [super initWithWindowNibName:@"HBMainWindow"];
    if (self) {
        directoryUrl = url;
        id editor = [[HBEditorViewController alloc] init];
        [self setEditorController: editor];
        [self setFileListController:[[HBFileListViewController alloc] initWithPath: url.path]];
    }
    return self;
}

-(void)awakeFromNib {
    [super awakeFromNib];
    [[self editorView] setContentView: self.editorController.view];
    [[self fileListView] setContentView: self.fileListController.view];
    [[self window] setTitle: directoryUrl.path];

    [[self fileListController] addObserver:self
                          forKeyPath:@"selectionIndexes"
                             options:NSKeyValueObservingOptionNew
                             context:nil];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if([keyPath isEqualToString:@"selectionIndexes"]) {
        NSUInteger selectionIndex = [[[self fileListController] selectionIndexes] firstIndex];
        if(selectionIndex == NSNotFound){
            return;
        }
        HBPost *selectedPost = [[[self fileListController] posts] objectAtIndex:selectionIndex];
        
        [[self editorController] setCurrentPost:selectedPost];
    }
}

-(void)saveCurrentPost {
    id posts = [directoryUrl.path stringByAppendingPathComponent:@"_posts"];

    HBPost *post = [[self editorController] currentPost];

    [HBPostWriter writeToFile:posts post: post];
}

@end
