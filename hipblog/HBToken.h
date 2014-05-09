//
//  HBToken.h
//  hipblog
//
//  Created by Jan Schulte on 09/05/14.
//  Copyright (c) 2014 schultyy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HBToken : NSObject

@property (assign) NSInteger identifier;

@property (retain) id value;

-(id) initWithIdentifier: (NSInteger) identifier andValue: (id) value;

@end
