//
// Created by Jan Schulte on 11/05/14.
// Copyright (c) 2014 schultyy. All rights reserved.
//

#import "HBFileListViewController.h"
#import "HBPostReader.h"


@implementation HBFileListViewController

-(id)initWithPath:(NSString *)path {
    self = [super initWithNibName:@"HBFileListView" bundle:nil];
    if(self) {
        directoryPath = path;
    }
    return self;
}

-(void)awakeFromNib {
    [super awakeFromNib];
    [self reload];
}

-(void) reload {
    NSArray *posts = [HBPostReader readPosts:directoryPath];
    [self setPosts:posts];
}

@end
