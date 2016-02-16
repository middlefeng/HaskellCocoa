//
//  HNSObject.m
//  
//
//  Created by middleware on 2/13/16.
//
//

#import <AppKit/AppKit.h>

#import "HNSView.h"


void hns_view_addSubview(HsPtr view, HsPtr subview)
{
    NSView* pView = (__bridge NSView *)(view);
    NSView* pSubview = (__bridge NSView *)(subview);
    [pView addSubview:pSubview];
}



void hns_view_removeFromSuperview(HsPtr view)
{
    NSView* pView = (__bridge NSView *)(view);
    [pView removeFromSuperview];
}


void hns_view_setFrame(HsPtr view, double x, double y, double width, double height)
{
    NSView* pView = (__bridge NSView *)(view);
    [pView removeFromSuperview];
    NSRect frame = NSMakeRect(x, y, width, height);
    [pView setFrame:frame];
}


