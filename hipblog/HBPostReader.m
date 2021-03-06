//
// Created by Jan Schulte on 11/05/14.
// Copyright (c) 2014 schultyy. All rights reserved.
//

#import "HBPostReader.h"
#import "HBPostParser.h"
#import "HBPost.h"


@implementation HBPostReader

+(NSArray *) forbidden {
    NSArray *excluded = @[ @".git" ];
    return excluded;
}

+(HBPost *)readPost:(NSString *)filePath {
    NSError *error = nil;
    NSString * fileContent = [NSString stringWithContentsOfFile:filePath
                                                       encoding:NSUTF8StringEncoding
                                                          error:&error];
    if(error) {
        NSLog(@"ERROR WHILE READING FILE: %@", [error localizedDescription]);
        return nil;
    }
    else {
        NSRange limRange = [fileContent rangeOfString:@"---" options:NSBackwardsSearch];
        NSRange frontMatterRange = NSMakeRange(0, limRange.location + 3);
        NSString *frontMatter = [fileContent substringWithRange:frontMatterRange];

        limRange = [fileContent rangeOfString:@"---\n" options:NSBackwardsSearch];
        NSUInteger startPosition = limRange.location + limRange.length;
        frontMatterRange = NSMakeRange(startPosition, [fileContent length] - startPosition);
        id contentStream = [fileContent substringWithRange:frontMatterRange];


        HBPostParser *parser = [[HBPostParser alloc] initWithFrontmatter:frontMatter];
        NSDictionary *frontMatterDict = [parser parse:nil];
        HBPost *freshlyParsedPost = [HBPost postFromHash: frontMatterDict andString: contentStream];
        [freshlyParsedPost setFilepath:filePath];
        return freshlyParsedPost;
    }
}

+(NSArray *) readPosts: (NSString *) directoryPath {
    NSMutableArray *postsArray = [NSMutableArray array];

    NSFileManager *fileManager = [NSFileManager defaultManager];

    NSError *errors = nil;
    NSArray *files = [fileManager contentsOfDirectoryAtPath:directoryPath error:&errors];
    if(errors) {
        NSLog(@"ERROR WHILE READING FILES: %@", [errors localizedDescription]);
    }
    [files enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if(![[HBPostReader forbidden] containsObject:obj]) {
            NSString *fullPath = [directoryPath stringByAppendingPathComponent:obj];
            HBPost *freshlyParsedPost = [HBPostReader readPost:fullPath];
            [postsArray addObject:freshlyParsedPost];
        }
    }];

    return postsArray;

}
@end
