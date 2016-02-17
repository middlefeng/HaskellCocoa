//
//  HNSObject.m
//  
//
//  Created by middleware on 2/13/16.
//
//

#import <AppKit/AppKit.h>

#import "HNSObject.h"
#import "HNSButton.h"


HsPtr hns_colorCreate(HsFloat r, HsFloat g, HsFloat b, HsFloat a)
{
    NSColor* color = [NSColor colorWithRed:r green:g blue:b alpha:a];
    hns_retain(color);
    return (__bridge HsPtr)(color);
}


