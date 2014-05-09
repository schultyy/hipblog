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

-(void) testTokenizesSeparator {
    id lexer = [self lexerWithString:@"---"];
    HBToken *token = [lexer nextToken];
    XCTAssertEqualObjects([token identifier], @"SEPARATOR");
    XCTAssertEqualObjects([token value], @"---");
}

-(void) testTokenizesEOF {
    id lexer = [self lexerWithString:@""];
    HBToken *token = [lexer nextToken];
    XCTAssertEqualObjects([token identifier], @"EOF");
    XCTAssertEqualObjects([token value], @"<EOF>");
}

-(void) testTokenizesKeyValue {
    id lexer = [self lexerWithString:@"title: awesome"];
    HBToken *titleToken = [lexer nextToken];
    HBToken *colonToken = [lexer nextToken];
    HBToken *valueToken = [lexer nextToken];
    HBToken *eofToken   = [lexer nextToken];

    XCTAssertEqualObjects([titleToken identifier], @"TEXT");
    XCTAssertEqualObjects([titleToken value], @"title");

    XCTAssertEqualObjects([colonToken identifier], @"COLON");
    XCTAssertEqualObjects([colonToken value], @":");

    XCTAssertEqualObjects([valueToken identifier], @"TEXT");
    XCTAssertEqualObjects([valueToken value], @"awesome");

    XCTAssertEqualObjects([eofToken identifier], @"EOF");
}

@end
