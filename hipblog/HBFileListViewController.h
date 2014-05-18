//
// Created by Jan Schulte on 11/05/14.
// Copyright (c) 2014 schultyy. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface HBFileListViewController : NSViewController {
    NSString *directoryPath;
}

@property (retain) NSArray *posts;

@property (retain) NSIndexSet *selectionIndexes;

-(id) initWithPath: (NSString *) path;

@end
