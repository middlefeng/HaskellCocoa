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


HsPtr hns_ColorCreate(HsDouble r, HsDouble g, HsDouble b, HsDouble a)
{
    NSColor* color = [NSColor colorWithRed:r green:g blue:b alpha:a];
    hns_retain(color);
    return (__bridge HsPtr)(color);
}


void hns_color_set(HsPtr color)
{
    NSColor* pColor = (__bridge NSColor*)color;
    [pColor set];
}

