//
//  Canvas.m
//  bubble
//
//  Created by middleware on 3/5/16.
//  Copyright © 2016 dfeng. All rights reserved.
//

#import "Canvas.h"
#import "HNSObject.h"
#import "Canvas_stub.h"

@implementation Canvas

- (void)drawRect:(NSRect)dirtyRect
{
    [super drawRect:dirtyRect];
    canvas_drawRect((__bridge HsPtr)self,
                    dirtyRect.origin.x,
                    dirtyRect.origin.y,
                    dirtyRect.size.width,
                    dirtyRect.size.height);
}

@end



HsPtr canvasCreate()
{
    Canvas* canvas = [[Canvas alloc] init];
    hns_retain(canvas);
    return (__bridge HsPtr)canvas;
}



