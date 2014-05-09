//
//  HBPostParser.m
//  hipblog
//
//  Created by Jan Schulte on 09/05/14.
//  Copyright (c) 2014 schultyy. All rights reserved.
//

#import "HBPostParser.h"
#import "HBPost.h"
#import "HBTokenIdentifiers.h"

@implementation HBPostParser

-(id) initWithTokenSource: (NSObject<HBTokenSource> *) source {
    self = [super init];
    if(self) {
        tokenSource = source;
        frontMatterActive = false;
    }
    return self;
}

-(HBPost *)parse:(NSError **)error {
    HBPost *post = [[HBPost alloc] init];

    HBToken *token = [tokenSource nextToken];

    while ([token identifier] != HB_EOF_IDENTIFIER) {

        if(frontMatterActive) {
            if([token identifier] == HB_TEXT_IDENTIFIER) {
                if([[[token value] lowercaseString] isEqualToString:@"title"] ||
                   [[[token value] lowercaseString] isEqualToString:@"layout"]) {
                    NSString *property = [[token value] lowercaseString];
                    HBToken *colonToken = [tokenSource nextToken];
                    if([colonToken identifier] == HB_COLON_IDENTIFIER) {
                        HBToken *valueToken = [tokenSource nextToken];
                        [post setValue: valueToken.value forKey: property];
                    }
                }
            }
        }
        else {
            if([token identifier] == HB_TEXT_IDENTIFIER){
                NSMutableString *str = [[NSMutableString alloc] initWithString: post.content];
                [str appendString: token.value];
                [post setContent: str];
            }
        }
        if([token identifier] == HB_SEPARATOR_IDENTIFIER) {
            if(!frontMatterActive) {
                frontMatterActive = true;
            }
            else {
                frontMatterActive = false;
            }
        }

        token = [tokenSource nextToken];
    }
    return post;
}

@end
