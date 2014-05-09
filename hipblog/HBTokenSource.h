//
//  HBTokenSource.h
//  hipblog
//
//  Created by Jan Schulte on 09/05/14.
//  Copyright (c) 2014 schultyy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HBToken.h"

@protocol HBTokenSource <NSObject>

-(HBToken *) nextToken;

@end
