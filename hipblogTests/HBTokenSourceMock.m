//
//  HBTokenSourceMock.m
//  hipblog
//
//  Created by Jan Schulte on 09/05/14.
//  Copyright (c) 2014 schultyy. All rights reserved.
//

#import "HBTokenSourceMock.h"
#import "HBTokenIdentifiers.h"

@implementation HBTokenSourceMock

-(id) init {
    self = [super init];
    if(self) {
        tokens = [NSArray array];
        current = 0;
    }
    return self;
}

-(id) initWithTokens: (NSArray *) tokenSource {
    self = [self init];
    if(self) {
        tokens = tokenSource;
    }
    return self;
}

-(HBToken *) nextToken {
    if(current < [tokens count]) {
        return [tokens objectAtIndex: current++];
    }
    HBToken *eof = [[HBToken alloc] init];
    [eof setIdentifier: HB_EOF_IDENTIFIER];
    return eof;
}

-(void) addToken:(HBToken *)token {
    tokens = [tokens arrayByAddingObject:token];
}

@end
