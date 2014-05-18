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

-(NSString *) filename {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];

    [formatter setDateFormat:@"yyyy-MM-dd"];

    NSString *dateStr = [formatter stringFromDate: self.frontMatter.date];

    NSString *cleanedTitle = [[[self frontMatter] title] stringByReplacingOccurrencesOfString:@" " withString:@"-"];

    return [NSString stringWithFormat:@"%@-%@.md", dateStr, cleanedTitle];
}

+ (HBPost *)postFromHash:(NSDictionary *)dictionary andString:(id) content {
    HBPost *freshPost = [[HBPost alloc] init];
    HBFrontMatter *matter = [freshPost frontMatter];

    NSString *title     = [dictionary objectForKey:@"title"];
    NSString *layout    = [dictionary objectForKey:@"layout"];
    NSString *category  = [dictionary objectForKey:@"categories"];
    NSString *dateStr   = [dictionary objectForKey:@"date"];
    //NSString *published = [dictionary objectForKey:@"published"];

    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date = [formatter dateFromString:dateStr];

    [matter setTitle:title];
    [matter setLayout:layout];
    [matter setCategories:category];
    [matter setDate: date];

    [freshPost setContent: content];
    return freshPost;
}
@end
