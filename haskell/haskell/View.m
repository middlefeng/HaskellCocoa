//
//  View.m
//  haskell
//
//  Created by middleware on 2/20/16.
//  Copyright © 2016 dfeng. All rights reserved.
//

#import "View.h"

@implementation View

- (void)drawRect:(NSRect)dirtyRect
{
    [super drawRect:dirtyRect];
    
    NSColor* color = [NSColor grayColor];
    [color set];
    
    NSRect rect = [self frame];
    rect.origin.x += 20;
    rect.origin.y += 20;
    rect.size.width -= 40;
    rect.size.height -= 40;
    NSBezierPath* path = [NSBezierPath bezierPathWithRoundedRect:rect xRadius:5 yRadius:5];
    [path stroke];
}

@end
