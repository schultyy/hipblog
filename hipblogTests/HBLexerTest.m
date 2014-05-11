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

-(HBPostLexer *) lexerWithString: (NSString *) str {
    id lexer = [[HBPostLexer alloc] initWithString:str];
    return lexer;
}

#pragma mark tokenize String

-(void) testTokenizesFrontMatter {
    id lexer = [self lexerWithString:@"---\ntitle: awesome\n---\nBlog post content"];
    HBToken *firstSepToken = [lexer nextToken];
    HBToken *titleToken    = [lexer nextToken];
    HBToken *colonToken    = [lexer nextToken];
    HBToken *valueToken    = [lexer nextToken];
    HBToken *secSepToken   = [lexer nextToken];
    HBToken *eofToken      = [lexer nextToken];
    
    XCTAssertEqual([firstSepToken identifier], HB_SEPARATOR_IDENTIFIER);
    
    XCTAssertEqual([titleToken identifier], HB_TEXT_IDENTIFIER);
    XCTAssertEqualObjects([titleToken value], @"title");
    
    XCTAssertEqual([colonToken identifier], HB_COLON_IDENTIFIER);
    XCTAssertEqualObjects([colonToken value], @":");
    
    XCTAssertEqual([valueToken identifier], HB_TEXT_IDENTIFIER);
    XCTAssertEqualObjects([valueToken value], @"awesome");
    
    XCTAssertEqual([secSepToken identifier], HB_SEPARATOR_IDENTIFIER);

    XCTAssertEqual([eofToken identifier], HB_EOF_IDENTIFIER);
}

@end
