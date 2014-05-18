//
//  HBPostTest.m
//  hipblog
//
//  Created by Jan Schulte on 18/05/14.
//  Copyright (c) 2014 schultyy. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "HBPost.h"
#import "HBFrontMatter.h"

@interface HBPostTest : XCTestCase {
    HBPost *blogpost;
}
@end

@implementation HBPostTest

-(void) setUp {
    NSMutableDictionary *data = [NSMutableDictionary dictionary];
    [data setObject:@"2014-05-11 19:29:25" forKey:@"date"];
    [data setObject:@"This is the title" forKey:@"title"];
    [data setObject:@"post" forKey:@"layout"];
    [data setObject:@"materials" forKey:@"categories"];
    
    blogpost = [HBPost postFromHash:data andString:@""];
}

-(void) testParsePostDateNotNil {
    XCTAssertNotNil([blogpost.frontMatter date]);
}

-(void) testParsePostTitle {
    XCTAssertEqualObjects([blogpost.frontMatter title], @"This is the title");
}

-(void) testParsePostLayout {
    XCTAssertEqualObjects([blogpost.frontMatter layout], @"post");
}

-(void) testParsePostCategory {
    XCTAssertEqualObjects([blogpost.frontMatter categories], @"materials");
}

@end
