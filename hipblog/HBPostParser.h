//
//  HBPostParser.h
//  hipblog
//
//  Created by Jan Schulte on 09/05/14.
//  Copyright (c) 2014 schultyy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HBTokenSource.h"

@class HBPost;

@interface HBPostParser : NSObject {
    NSObject<HBTokenSource> *tokenSource;
    BOOL frontMatterActive;
}

-(id) initWithTokenSource: (NSObject<HBTokenSource> *) source;

-(HBPost *) parse: (NSError **) error;

@end
