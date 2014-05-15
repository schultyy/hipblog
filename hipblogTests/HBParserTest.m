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
    HBPostParser *parser;
    NSString *testFrontmatter;
    NSDictionary *hash;
}

@end

@implementation HBParserTest

-(void) setUp {
    [super setUp];
    testFrontmatter = @"---\n\
    layout: post\n\
    title: \"Learning group 15.04.2014 - Zen of Ruby\"\n\
    date: 2014-04-15 19:15:00\n\
    published: true\n\
    category: materials\n\
    ---";
    parser = [[HBPostParser alloc] initWithFrontmatter: testFrontmatter];
    hash = [parser parse:nil];
}

-(void) testParseHashNotNil {
    XCTAssertNotNil(hash);
}

-(void) testHasLayoutKey {
    XCTAssertTrue([[hash allKeys] containsObject:@"layout"]);
}

-(void) testParsesLayout {

    NSString *layout = [hash objectForKey:@"layout"];
    XCTAssertEqualObjects(layout, @"post");
}

-(void) testHasTitleKey {
    XCTAssertTrue([[hash allKeys] containsObject:@"title"]);
}

-(void) testParsesTitle {
    NSString *title = [hash objectForKey:@"title"];
    XCTAssertEqualObjects(title, @"\"Learning group 15.04.2014 - Zen of Ruby\"");
}

-(void) testHasDateKey {
    XCTAssertTrue([[hash allKeys] containsObject:@"date"]);
}

-(void) testParsesDate {
    NSString *date = [hash objectForKey:@"date"];
    XCTAssertEqualObjects(date, @"2014-04-15 19:15:00");
}

-(void) testHasPublishedKey {
    XCTAssertTrue([[hash allKeys] containsObject:@"published"]);
}

-(void) testParsesPublished {
    NSString *published = [hash objectForKey:@"published"];
    XCTAssertEqualObjects(published, @"true");
}

-(void) testHasCategoryKey {
    XCTAssertTrue([[hash allKeys] containsObject:@"category"]);
}

-(void) testParsesCategory {
    NSString *category = [hash objectForKey:@"category"];
    XCTAssertEqualObjects(category, @"materials");
}

@end
