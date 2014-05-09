//
// Created by Jan Schulte on 07/05/14.
// Copyright (c) 2014 schultyy. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface HBPost : NSObject

@property (retain) NSURL *filepath;

@property (retain) NSString *title;

@property (retain) NSString *content;

@property (retain) NSString *layout;

+(HBPost *) fromFile: (NSString *) filePath;

@end
