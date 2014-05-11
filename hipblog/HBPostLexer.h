//
//  HBPostLexer.h
//  hipblog
//
//  Created by Jan Schulte on 09/05/14.
//  Copyright (c) 2014 schultyy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HBToken.h"
#import "HBTokenSource.h"

@interface HBPostLexer : NSObject<HBTokenSource> {
    NSString *contentStream;
    NSUInteger current;
    NSUInteger separatorCharCount;
    NSUInteger separatorCount;
}

-(id) initWithString: (NSString *) stream;

-(HBToken *) nextToken;

@end
