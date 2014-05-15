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

-(id) initWithFrontmatter: (NSString *) frontMatter {
    self = [super init];
    if(self) {
        fileContent = frontMatter;
        current = 0;
    }
    return self;
}

-(NSDictionary *) parse:(NSError **)error {
    [self consume];

    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];

    NSMutableString *buffer = [NSMutableString string];
    NSString *tempKey = nil;
    while([self canConsume]) {
        if(!allowDash && currentChar == '-') {
            if([self lookahead] == '\n') {
                [self consume];
                [self consume];
                allowDash = YES;
            }
            [self consume];
            continue;
        }
        if(!allowColon && currentChar == ':') {
            tempKey = [[NSString alloc] initWithString:buffer];
            //tempKey = [buffer copy];
            [buffer setString:@""];
            allowColon = YES;
        }
        else if(currentChar == '\n') {
            NSString *tempValue = [[NSString alloc] initWithString: buffer];
            [buffer setString:@""];
            allowColon = NO;
            [dictionary setObject: [tempValue stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceCharacterSet]]
                           forKey: [tempKey stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]];

        }
        else {
            [buffer appendString: [NSString stringWithCharacters:&currentChar length:1]];
        }

        [self consume];
    }
    NSLog(@"DICT: %@", dictionary);
    return dictionary;
}

-(unichar) lookahead {
    if(current + 1 < [fileContent length]) {
        return [fileContent characterAtIndex: current + 1];
    }
    return EOF;
}

-(void) consume {
    if([self canConsume]) {
        currentChar = [fileContent characterAtIndex:current++];
    }
}

-(BOOL) canConsume {
    return current < [fileContent length];
}

@end
