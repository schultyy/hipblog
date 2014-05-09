//
// Created by Jan Schulte on 07/05/14.
// Copyright (c) 2014 schultyy. All rights reserved.
//

#import "HBPost.h"


@implementation HBPost

-(id) init {
    self = [super init];
    if(self) {
        [self setTitle:@""];
        [self setContent:@""];
        [self setLayout:@""];
    }
    return self;
}

+(HBPost *) fromFile: (NSString *) filePath {
    NSLog(@"PATH: %@", [filePath class]);
    NSLog(@"PATH: %@", filePath);
    NSString *contents = [NSString stringWithContentsOfFile:filePath encoding:NSStringEncodingConversionAllowLossy error:nil];
    NSLog(@"contents: %@", contents);
    return nil;
}

+(void) parseFile: (NSString *) file {
}

+(NSString *) parseTitleFrom: (NSString *) content {
    return nil;
}

@end
