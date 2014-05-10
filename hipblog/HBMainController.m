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

- (id)initWitDirectoryPath: (NSURL *) url
{
    self = [super initWithWindowNibName:@"HBMainWindow"];
    if (self) {
        directoryUrl = url;
        id editor = [[HBEditorViewController alloc] init];
        [self setEditorController: editor];
    }
    return self;
}

-(void)awakeFromNib {
    [super awakeFromNib];
    [[self editorView] setContentView: self.editorController.view];
    [[self window] setTitle: directoryUrl.path];
}

-(NSArray *) readPosts {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    id str = [[[NSString alloc] initWithString:[directoryUrl path]] stringByAppendingPathComponent:@"_posts"];
    return [fileManager contentsOfDirectoryAtPath:str error:nil];
}

- (void)windowDidLoad
{
    [super windowDidLoad];
    NSArray *arr = [self readPosts];
    for(NSUInteger i = 0; i < arr.count; i++) {
        id current = [arr objectAtIndex:i];

        id posts = [directoryUrl.path stringByAppendingPathComponent:@"_posts"];

        id absolutePath = [posts stringByAppendingPathComponent:current];

        [HBPost fromFile: absolutePath];
    }
}

-(void)saveCurrentPost {
    id posts = [directoryUrl.path stringByAppendingPathComponent:@"_posts"];

    HBPost *post = [[self editorController] currentPost];

    [HBPostWriter writeToFile:posts post: post];
}

@end
