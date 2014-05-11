//
//  HBParserTest.m
//  hipblog
//
//  Created by Jan Schulte on 09/05/14.
//  Copyright (c) 2014 schultyy. All rights reserved.
//


#import <XCTest/XCTest.h>
#import "HBTokenSourceMock.h"
#import "HBPostParser.h"
#import "HBTokenIdentifiers.h"
#import "HBPost.h"
#import "HBFrontMatter.h"

@interface HBParserTest : XCTestCase {
    HBTokenSourceMock *tokenSource;
    HBPostParser *parser;
}

@end

@implementation HBParserTest


-(void) testParseBlogpostWithTitle {
    //preface
    tokenSource = [[HBTokenSourceMock alloc] init];
    parser = [[HBPostParser alloc] initWithTokenSource: tokenSource andFileContent:@"---\ntitle: Hello\n---\nCONTENTS"];
    [tokenSource addToken: [[HBToken alloc]initWithIdentifier: HB_SEPARATOR_IDENTIFIER andValue:@"---"]];
    [tokenSource addToken: [[HBToken alloc]initWithIdentifier: HB_TEXT_IDENTIFIER andValue:@"Title"]];
    [tokenSource addToken: [[HBToken alloc]initWithIdentifier: HB_COLON_IDENTIFIER andValue:@":"]];
    [tokenSource addToken: [[HBToken alloc]initWithIdentifier: HB_TEXT_IDENTIFIER andValue:@"Hello"]];
    [tokenSource addToken: [[HBToken alloc]initWithIdentifier: HB_SEPARATOR_IDENTIFIER andValue:@"---"]];
    [tokenSource addToken: [[HBToken alloc]initWithIdentifier: HB_TEXT_IDENTIFIER andValue:@"CONTENTS"]];
    HBPost *post = [parser parse: nil];
    //asserts

    XCTAssertEqualObjects([post.frontMatter title], @"Hello");
    XCTAssertEqualObjects([post content], @"CONTENTS");
}

-(void) testParseBlogpostWithTitleAndLayout {
    //preface
    tokenSource = [[HBTokenSourceMock alloc] init];
    parser = [[HBPostParser alloc] initWithTokenSource: tokenSource andFileContent:@"---\ntitle: Hello\nlayout: post\n---\nCONTENTS\nFOO BAR BAZ"];
    [tokenSource addToken: [[HBToken alloc]initWithIdentifier: HB_SEPARATOR_IDENTIFIER andValue:@"---"]];
    [tokenSource addToken: [[HBToken alloc]initWithIdentifier: HB_TEXT_IDENTIFIER andValue:@"Title"]];
    [tokenSource addToken: [[HBToken alloc]initWithIdentifier: HB_COLON_IDENTIFIER andValue:@":"]];
    [tokenSource addToken: [[HBToken alloc]initWithIdentifier: HB_TEXT_IDENTIFIER andValue:@"Hello"]];
    
    [tokenSource addToken: [[HBToken alloc]initWithIdentifier: HB_TEXT_IDENTIFIER andValue:@"layout"]];
    [tokenSource addToken: [[HBToken alloc]initWithIdentifier: HB_COLON_IDENTIFIER andValue:@":"]];
    [tokenSource addToken: [[HBToken alloc]initWithIdentifier: HB_TEXT_IDENTIFIER andValue:@"post"]];
    
    [tokenSource addToken: [[HBToken alloc]initWithIdentifier: HB_SEPARATOR_IDENTIFIER andValue:@"---"]];
    [tokenSource addToken: [[HBToken alloc]initWithIdentifier: HB_TEXT_IDENTIFIER andValue:@"CONTENTS\nFOO BAR BAZ"]];
    HBPost *post = [parser parse: nil];
    //asserts
    
    XCTAssertEqualObjects([post.frontMatter title], @"Hello");
    XCTAssertEqualObjects([post content], @"CONTENTS\nFOO BAR BAZ");
    XCTAssertEqualObjects([post.frontMatter layout], @"post");
}

@end
