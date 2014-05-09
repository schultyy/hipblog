//
//  HBToken.m
//  hipblog
//
//  Created by Jan Schulte on 09/05/14.
//  Copyright (c) 2014 schultyy. All rights reserved.
//

#import "HBToken.h"

@implementation HBToken

-(id) init {
    self = [self initWithIdentifier: 0 andValue:nil];
    return self;
}

-(id) initWithIdentifier: (NSInteger) identifier andValue: (id) value {
    self = [super init];
    if(self) {
        [self setIdentifier:identifier];
        [self setValue:value];
    }
    return self;
}

@end
