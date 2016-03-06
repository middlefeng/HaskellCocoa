//
//  Canvas.m
//  bubble
//
//  Created by middleware on 3/5/16.
//  Copyright © 2016 dfeng. All rights reserved.
//

#import "Canvas.h"
#import "HNSObject.h"

@implementation Canvas

- (void)drawRect:(NSRect)dirtyRect
{
    [super drawRect:dirtyRect];
}

@end



HsPtr canvasCreate()
{
    Canvas* canvas = [[Canvas alloc] init];
    hns_retain(canvas);
    return (__bridge HsPtr)canvas;
}



