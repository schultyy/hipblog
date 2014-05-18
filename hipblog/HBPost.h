//
// Created by Jan Schulte on 07/05/14.
// Copyright (c) 2014 schultyy. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HBFrontMatter;


@interface HBPost : NSObject

@property (retain) NSString *filepath;

@property (retain) HBFrontMatter *frontMatter;

@property (retain) NSString *content;

+ (HBPost *)postFromHash:(NSDictionary *)dictionary andString:(id)content;

-(NSString *) filename;
@end
