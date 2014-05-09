//
//  HBLexerTest.m
//  hipblog
//
//  Created by Jan Schulte on 09/05/14.
//  Copyright (c) 2014 schultyy. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "HBPostLexer.h"

@interface HBLexerTest : XCTestCase

@end

@implementation HBLexerTest

static NSString *testStrTitle = @"title: Awesome blog post";

-(HBPostLexer *) lexerWithString: (NSString *) str {
    id lexer = [[HBPostLexer alloc] initWithString:str];
    return lexer;
}

#pragma mark tokenize String

-(void) testTokenizesTitle {
    id lexer = [self lexerWithString:@"title"];
    HBToken *token = [lexer nextToken];
    XCTAssertEqualObjects([token identifier], @"TEXT");
    XCTAssertEqualObjects([token value], @"title");
}

-(void) testTokenizesColon {
    id lexer = [self lexerWithString:@":"];
    HBToken *token = [lexer nextToken];
    XCTAssertEqualObjects([token identifier], @"COLON");
    XCTAssertEqualObjects([token value], @":");
}

@end
