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

-(BOOL) isChar: (unichar) ch {
    return (ch >= 'a' && ch <= 'z') ||
            (ch >= 'A' && ch <= 'Z');
}

-(HBToken *) nextToken {
    NSMutableString *buffer = nil;
    HBToken *currentToken = nil; // [[HBToken alloc] init];
    NSString *cstr = nil;

    while(current < [contentStream length]) {
        unichar c = [contentStream characterAtIndex:current];

        if(!buffer) {
            buffer = [[NSMutableString alloc] init];
        }
        switch(c) {
            case ((unichar)32):
            case '\t':
            case '\n':
                break;
            case ':':
                currentToken = [[HBToken alloc] init];
                [currentToken setIdentifier:@"COLON"];
                [currentToken setValue:@":"];
                current++;
                return currentToken;
            case '-':
                if(separatorCount < 2) {
                    separatorCount++;
                    break;
                } else {
                    separatorCount = 0;
                    currentToken = [[HBToken alloc] init];
                    [currentToken setIdentifier:@"SEPARATOR"];
                    [currentToken setValue:@"---"];
                    current++;
                    return currentToken;
                }
            default:
                cstr = [[NSString alloc] initWithBytes:&c length:1 encoding:NSStringEncodingConversionAllowLossy];
                [buffer appendString: cstr];
                unichar lookahead;
                if(current + 1 < [contentStream length]) {
                    lookahead = [contentStream characterAtIndex: current + 1];
                } else {
                    lookahead = 0;
                }

                if(![self isChar:lookahead]) {
                    HBToken *tmp = [[HBToken alloc] init];
                    [tmp setIdentifier:@"TEXT"];
                    [tmp setValue:buffer];
                    current++;
                    return tmp;
                }
                break;
        }

        current++;
    }
    HBToken *eof = [[HBToken alloc] init];
    [eof setIdentifier:@"EOF"];
    [eof setValue:@"<EOF>"];
    return eof;
}

@end
