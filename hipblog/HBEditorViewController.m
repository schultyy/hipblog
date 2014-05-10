//
//  HBEditorViewController.m
//  hipblog
//
//  Created by Jan Schulte on 10/05/14.
//  Copyright (c) 2014 schultyy. All rights reserved.
//

#import "HBEditorViewController.h"

@interface HBEditorViewController ()

@end

@implementation HBEditorViewController

- (id)init
{
    self = [super initWithNibName:@"HBEditorView" bundle:nil];
    if (self) {
        // Initialization code here.
    }
    return self;
}

/*
 From https://developer.apple.com/library/mac/qa/qa1454/_index.htmlg
 */
- (BOOL)control:(NSControl*)control textView:(NSTextView*)textView doCommandBySelector:(SEL)commandSelector
{
    BOOL result = NO;
    
    if (commandSelector == @selector(insertNewline:))
    {
        // new line action:
        // always insert a line-break character and don’t cause the receiver to end editing
        [textView insertNewlineIgnoringFieldEditor:self];
        result = YES;
    }
    else if (commandSelector == @selector(insertTab:))
    {
        // tab action:
        // always insert a tab character and don’t cause the receiver to end editing
        [textView insertTabIgnoringFieldEditor:self];
        result = YES;
    }
    
    return result;
}

@end
