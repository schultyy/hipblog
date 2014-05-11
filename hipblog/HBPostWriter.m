//
// Created by Jan Schulte on 10/05/14.
// Copyright (c) 2014 schultyy. All rights reserved.
//

#import "HBPostWriter.h"
#import "HBPost.h"
#import "HBFrontMatter.h"


@implementation HBPostWriter {

}

+(void) writeToFile: (NSString *) directoryPath post: (HBPost *) post {
    NSMutableString *fileContent = [[NSMutableString alloc] init];
    
    //frontmatter
    [fileContent appendString:@"---\n"];
    [fileContent appendString: [NSString stringWithFormat:@"title: %@\n", post.frontMatter.title]];
    [fileContent appendString: [NSString stringWithFormat:@"layout: %@\n", post.frontMatter.layout]];
    [fileContent appendString: [NSString stringWithFormat:@"categories: %@\n", post.frontMatter.categories]];
    [fileContent appendString:@"---\n"];
    //Content
    [fileContent appendString: post.content];

    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];

    [formatter setDateFormat:@"yyyy-MM-dd"];

    NSString *dateStr = [formatter stringFromDate:post.frontMatter.date];

    NSString *fileName = [NSString stringWithFormat:@"%@-%@.md", dateStr, post.frontMatter.title];

    NSString *absolutePath = [directoryPath stringByAppendingPathComponent:fileName];

    [fileContent writeToFile: absolutePath
                  atomically: NO
                    encoding: NSStringEncodingConversionAllowLossy
                       error: nil];
}

@end
