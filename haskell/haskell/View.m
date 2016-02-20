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
    
    NSColor* color = [NSColor grayColor];
    [color set];
    
    NSRect rect = [self frame];
    rect.origin.x += 20;
    rect.origin.y += 20;
    rect.size.width -= 40;
    rect.size.height -= 40;
    NSBezierPath* path = [NSBezierPath bezierPathWithRoundedRect:rect xRadius:5 yRadius:5];
    [path stroke];
    
   // _userButton.frame = NSMakeRect(rect.size.width - 200, 50, 200, 30);
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
