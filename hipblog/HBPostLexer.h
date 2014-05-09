//
//  HBPostLexer.h
//  hipblog
//
//  Created by Jan Schulte on 09/05/14.
//  Copyright (c) 2014 schultyy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HBToken.h"

@interface HBPostLexer : NSObject {
    NSString *contentStream;
    NSUInteger current;
    NSUInteger separatorCount;
}

-(id) initWithString: (NSString *) stream;

-(HBToken *) nextToken;

@end
