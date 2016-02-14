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


HsPtr hns_createButton()
{
    NSButton* button = [[NSButton alloc] init];
    hns_retain(button);
    return (__bridge HsPtr)(button);
}


