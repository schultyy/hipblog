//
//  HBPostLexer.m
//  hipblog
//
//  Created by Jan Schulte on 09/05/14.
//  Copyright (c) 2014 schultyy. All rights reserved.
//

#import "HBPostLexer.h"

@implementation HBPostLexer

-(id) initWithString: (NSString *) stream {
    self = [super init];
    if(self) {
        contentStream = stream;
        current = 0;
        separatorCount = 0;
    }
    return self;
}

-(HBToken *) nextToken {
    NSMutableString *buffer = nil;
    HBToken *currentToken = [[HBToken alloc] init];

    while(current < [contentStream length]) {
        unichar c = [contentStream characterAtIndex:current];

        if(!buffer) {
            buffer = [[NSMutableString alloc] init];
        }
        switch(c) {
            case ':':
                [currentToken setIdentifier:@"COLON"];
                [currentToken setValue:@":"];
                return currentToken;
            case '-':
                if(separatorCount < 2) {
                    separatorCount++;
                    break;
                } else {
                    separatorCount = 0;
                    [currentToken setIdentifier:@"SEPARATOR"];
                    [currentToken setValue:@"---"];
                    return currentToken;
                }
            default:
                [currentToken setIdentifier:@"TEXT"];
                id cstr = [[NSString alloc] initWithBytes:&c length:1 encoding:NSStringEncodingConversionAllowLossy];
                [buffer appendString: cstr];
                [currentToken setValue:buffer];
                break;
        }

        current++;
    }
    return currentToken;
}

@end
