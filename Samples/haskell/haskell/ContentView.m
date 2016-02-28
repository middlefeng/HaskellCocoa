//
//  ContentView.m
//  haskell
//
//  Created by middleware on 2/27/16.
//  Copyright © 2016 dfeng. All rights reserved.
//

#import "ContentView.h"

#import "HsFFI.h"
#import "HNSObject.h"
#import "ContentView_stub.h"


@implementation ContentView

- (void)drawRect:(NSRect)dirtyRect
{
    [super drawRect:dirtyRect];
    contentView_drawRect((__bridge HsPtr)self,
                         dirtyRect.origin.x,
                         dirtyRect.origin.y,
                         dirtyRect.size.width,
                         dirtyRect.size.height);
}

@end



HsPtr contentViewCreate(void)
{
    ContentView* pView = [[ContentView alloc] init];
    hns_retain(pView);
    return (__bridge HsPtr)pView;
}

