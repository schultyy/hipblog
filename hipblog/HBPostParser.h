//
//  HBPostParser.h
//  hipblog
//
//  Created by Jan Schulte on 09/05/14.
//  Copyright (c) 2014 schultyy. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HBPost;

@interface HBPostParser : NSObject {
    NSString *fileContent;
    NSUInteger current;
    unichar currentChar;
    BOOL allowDash;
    BOOL allowColon;
}

-(id) initWithFrontmatter: (NSString *) frontMatter;

-(NSDictionary *) parse:(NSError **)error;

@end
