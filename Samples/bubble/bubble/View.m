//
//  View.m
//  haskell
//
//  Created by middleware on 2/20/16.
//  Copyright © 2016 dfeng. All rights reserved.
//

#import "View.h"

#import "HsFFI.h"
#import "View_stub.h"



@interface View()

@property (nonatomic, weak) NSButton* userButton;

@end





@implementation View

- (void)drawRect:(NSRect)dirtyRect
{
    [super drawRect:dirtyRect];
    view_drawRect((__bridge HsPtr)self,
                  dirtyRect.origin.x,
                  dirtyRect.origin.y,
                  dirtyRect.size.width,
                  dirtyRect.size.height);
}


- (void)mouseDown:(NSEvent *)theEvent
{
    NSPoint loc = theEvent.locationInWindow;
    view_mouseDown((__bridge HsPtr)self, loc.x, loc.y);
}


@end




void view_setUserButton(HsPtr view, HsPtr button)
{
    View* pView = (__bridge View*)view;
    NSButton* pButton = (__bridge NSButton*)button;
    pView.userButton = pButton;
}


HsPtr view_userButton(HsPtr view)
{
    View* pView = (__bridge View*)view;
    return (__bridge HsPtr)pView.userButton;
}
