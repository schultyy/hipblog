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

+ (HBPost *)postFromHash:(NSDictionary *)dictionary andString:(id) content {
    HBPost *freshPost = [[HBPost alloc] init];
    HBFrontMatter *matter = [freshPost frontMatter];

    NSString *title     = [dictionary objectForKey:@"title"];
    NSString *layout    = [dictionary objectForKey:@"layout"];
    NSString *category  = [dictionary objectForKey:@"category"];
    NSString *date      = [dictionary objectForKey:@"date"];
    //NSString *published = [dictionary objectForKey:@"published"];


    [matter setTitle:title];
    [matter setLayout:layout];
    [matter setCategories:category];
    [matter setDate: [NSDate dateWithString: date]];

    [freshPost setContent: content];
    return freshPost;
}
@end
