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


@implementation ContentView

- (void)drawRect:(NSRect)dirtyRect
{
    [super drawRect:dirtyRect];
}

@end



HsPtr contentViewCreate(void)
{
    ContentView* pView = [[ContentView alloc] init];
    hns_retain(pView);
    return (__bridge HsPtr)pView;
}

