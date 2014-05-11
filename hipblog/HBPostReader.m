//
// Created by Jan Schulte on 11/05/14.
// Copyright (c) 2014 schultyy. All rights reserved.
//

#import "HBPostReader.h"
#import "HBPostLexer.h"
#import "HBPostParser.h"
#import "HBPost.h"


@implementation HBPostReader

+(NSArray *) readPosts: (NSString *) directoryPath {
    NSMutableArray *postsArray = [NSMutableArray array];

    NSFileManager *fileManager = [NSFileManager defaultManager];

    NSError *errors = nil;
    NSArray *files = [fileManager contentsOfDirectoryAtPath:directoryPath error:&errors];
    if(errors) {
        NSLog(@"ERROR WHILE READING FILES: %@", [errors localizedDescription]);
    }
    [files enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSError *error = nil;
        NSString *fullPath = [directoryPath stringByAppendingPathComponent:obj];
        NSString * fileContent = [NSString stringWithContentsOfFile:fullPath
                                                           encoding:NSUTF8StringEncoding
                                                              error:&error];
        if(error) {
            NSLog(@"ERROR WHILE READING FILE: %@", [error localizedDescription]);
        }
        else {
            HBPostLexer *lexer = [[HBPostLexer alloc] initWithString:fileContent];
            HBPostParser *parser = [[HBPostParser alloc] initWithTokenSource:lexer];

            HBPost *freshlyParsedPost = [parser parse:nil];
            [postsArray addObject:freshlyParsedPost];
        }
    }];

    return postsArray;
}

@end
