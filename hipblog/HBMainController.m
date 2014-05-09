//
//  HBMainController.m
//  hipblog
//
//  Created by Jan Schulte on 07/05/14.
//  Copyright (c) 2014 schultyy. All rights reserved.
//

#import "HBMainController.h"
#import "HBPost.h"

@interface HBMainController ()

@end

@implementation HBMainController

- (id)initWitDirectoryPath: (NSURL *) url
{
    self = [super initWithWindowNibName:@"HBMainWindow"];
    if (self) {
        directoryUrl = url;
    }
    return self;
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

@end
