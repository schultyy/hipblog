//
// Created by Jan Schulte on 11/05/14.
// Copyright (c) 2014 schultyy. All rights reserved.
//

#import "HBFrontMatter.h"


@implementation HBFrontMatter

-(id) init {
    self = [super init];
    if(self) {
        [self setTitle:@""];
        [self setLayout:@""];
        [self setCategories:@""];
        [self setDate: [NSDate date]];
    }
    return self;
}

@end
