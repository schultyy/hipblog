//
//  HBPostParser.m
//  hipblog
//
//  Created by Jan Schulte on 09/05/14.
//  Copyright (c) 2014 schultyy. All rights reserved.
//

#import "HBPostParser.h"
#import "HBTokenIdentifiers.h"

#import "HBPost.h"
#import "HBFrontMatter.h"

@implementation HBPostParser

-(id) initWithTokenSource: (NSObject<HBTokenSource> *) source andFileContent: (NSString *) content {
    self = [super init];
    if(self) {
        tokenSource = source;
        fileContent = content;
    }
    return self;
}

-(HBPost *) parse:(NSError **)error {
    HBPost *post = [[HBPost alloc] init];
    HBFrontMatter *frontMatter = [post frontMatter];
    NSRange limRange = [fileContent rangeOfString:@"---\n" options:NSBackwardsSearch];
    NSUInteger startPosition = limRange.location + limRange.length;
    NSRange frontMatterRange = NSMakeRange(startPosition, [fileContent length] - startPosition);
    id contentStream = [fileContent substringWithRange:frontMatterRange];
    [post setContent: contentStream];
    HBToken *token = [tokenSource nextToken];

    while ([token identifier] != HB_EOF_IDENTIFIER) {
        if([token identifier] == HB_TEXT_IDENTIFIER) {
            if([[[token value] lowercaseString] isEqualToString:@"title"] ||
               [[[token value] lowercaseString] isEqualToString:@"layout"]) {
                NSString *property = [[token value] lowercaseString];
                HBToken *colonToken = [tokenSource nextToken];
                if([colonToken identifier] == HB_COLON_IDENTIFIER) {
                    HBToken *valueToken = [tokenSource nextToken];
                    [frontMatter setValue:valueToken.value forKey:property];
                }
            }
        }
        token = [tokenSource nextToken];
    }

    return post;
}

@end
