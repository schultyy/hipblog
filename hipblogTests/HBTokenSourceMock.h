//
//  HBTokenSourceMock.h
//  hipblog
//
//  Created by Jan Schulte on 09/05/14.
//  Copyright (c) 2014 schultyy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HBTokenSource.h"

@interface HBTokenSourceMock : NSObject<HBTokenSource> {
    NSArray *tokens;
    NSUInteger current;
}

-(id) initWithTokens: (NSArray *) tokenSource;
-(void) addToken: (HBToken *) token;

@end
