//
//  HBLexerTest.m
//  hipblog
//
//  Created by Jan Schulte on 09/05/14.
//  Copyright (c) 2014 schultyy. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "HBPostLexer.h"
#import "HBTokenIdentifiers.h"

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
    XCTAssertEqual([token identifier], HB_TEXT_IDENTIFIER);
    XCTAssertEqualObjects([token value], @"title");
}

-(void) testTokenizesColon {
    id lexer = [self lexerWithString:@":"];
    HBToken *token = [lexer nextToken];
    XCTAssertEqual([token identifier], HB_COLON_IDENTIFIER);
    XCTAssertEqualObjects([token value], @":");
}

-(void) testTokenizesSeparator {
    id lexer = [self lexerWithString:@"---"];
    HBToken *token = [lexer nextToken];
    XCTAssertEqual([token identifier], HB_SEPARATOR_IDENTIFIER);
    XCTAssertEqualObjects([token value], @"---");
}

-(void) testTokenizesEOF {
    id lexer = [self lexerWithString:@""];
    HBToken *token = [lexer nextToken];
    XCTAssertEqual([token identifier], HB_EOF_IDENTIFIER);
    XCTAssertEqualObjects([token value], @"<EOF>");
}

-(void) testTokenizesKeyValue {
    id lexer = [self lexerWithString:@"title: awesome"];
    HBToken *titleToken = [lexer nextToken];
    HBToken *colonToken = [lexer nextToken];
    HBToken *valueToken = [lexer nextToken];
    HBToken *eofToken   = [lexer nextToken];

    XCTAssertEqual([titleToken identifier], HB_TEXT_IDENTIFIER);
    XCTAssertEqualObjects([titleToken value], @"title");

    XCTAssertEqual([colonToken identifier], HB_COLON_IDENTIFIER);
    XCTAssertEqualObjects([colonToken value], @":");

    XCTAssertEqual([valueToken identifier], HB_TEXT_IDENTIFIER);
    XCTAssertEqualObjects([valueToken value], @"awesome");

    XCTAssertEqual([eofToken identifier], HB_EOF_IDENTIFIER);
}

-(void) testTokenizesPostWithFrontmatter {
    id lexer = [self lexerWithString:@"---\ntitle: awesome\n---\nBlog post content"];
    HBToken *firstSepToken = [lexer nextToken];
    HBToken *titleToken    = [lexer nextToken];
    HBToken *colonToken    = [lexer nextToken];
    HBToken *valueToken    = [lexer nextToken];
    HBToken *secSepToken   = [lexer nextToken];
    HBToken *content1Token = [lexer nextToken];
    HBToken *content2Token = [lexer nextToken];
    HBToken *content3Token = [lexer nextToken];
    HBToken *eofToken      = [lexer nextToken];
    
    XCTAssertEqual([firstSepToken identifier], HB_SEPARATOR_IDENTIFIER);
    
    XCTAssertEqual([titleToken identifier], HB_TEXT_IDENTIFIER);
    XCTAssertEqualObjects([titleToken value], @"title");
    
    XCTAssertEqual([colonToken identifier], HB_COLON_IDENTIFIER);
    XCTAssertEqualObjects([colonToken value], @":");
    
    XCTAssertEqual([valueToken identifier], HB_TEXT_IDENTIFIER);
    XCTAssertEqualObjects([valueToken value], @"awesome");
    
    XCTAssertEqual([secSepToken identifier], HB_SEPARATOR_IDENTIFIER);
    
    XCTAssertEqual([content1Token identifier], HB_TEXT_IDENTIFIER);
    XCTAssertEqualObjects([content1Token value], @"Blog");
    XCTAssertEqual([content2Token identifier], HB_TEXT_IDENTIFIER);
    XCTAssertEqualObjects([content2Token value], @"post");
    XCTAssertEqual([content3Token identifier], HB_TEXT_IDENTIFIER);
    XCTAssertEqualObjects([content3Token value], @"content");
    
    XCTAssertEqual([eofToken identifier], HB_EOF_IDENTIFIER);
}

@end
