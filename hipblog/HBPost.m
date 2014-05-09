//
// Created by Jan Schulte on 07/05/14.
// Copyright (c) 2014 schultyy. All rights reserved.
//

#import "HBPost.h"


@implementation HBPost

+(HBPost *) fromFile: (NSString *) filePath {
    NSLog(@"PATH: %@", [filePath class]);
    NSLog(@"PATH: %@", filePath);
    NSString *contents = [NSString stringWithContentsOfFile:filePath encoding:NSStringEncodingConversionAllowLossy error:nil];
    NSLog(@"contents: %@", contents);
    return nil;
}

+(void) parseFile: (NSString *) file {
    HBPost *post = [[HBPost alloc] init];

    for (NSString *line in [file componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]]) {
        if([line isEqualToString:@"title"]) {
//            NSString stringby
//            [post setTitle:<#(NSString *)title#>];
        }
    }
}

+(NSString *) parseTitleFrom: (NSString *) content {
    return nil;
}

@end
