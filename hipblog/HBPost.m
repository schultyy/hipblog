//
// Created by Jan Schulte on 07/05/14.
// Copyright (c) 2014 schultyy. All rights reserved.
//

#import "HBPost.h"
#import "HBFrontMatter.h"


@implementation HBPost

-(id) init {
    self = [super init];
    if(self) {
        [self setFrontMatter:[[HBFrontMatter alloc] init]];
        [self setContent:@""];
    }
    return self;
}

@end
