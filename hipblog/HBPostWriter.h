//
// Created by Jan Schulte on 10/05/14.
// Copyright (c) 2014 schultyy. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HBPost;


@interface HBPostWriter : NSObject

+(void) writeToFile: (NSString *) directoryPath post: (HBPost *) post;

@end
