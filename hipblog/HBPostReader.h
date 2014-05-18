//
// Created by Jan Schulte on 11/05/14.
// Copyright (c) 2014 schultyy. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HBPost;

@interface HBPostReader : NSObject
+(NSArray *) forbidden;
+(HBPost *) readPost: (NSString *) filePath;
+(NSArray *) readPosts: (NSString *) directoryPath;
@end
