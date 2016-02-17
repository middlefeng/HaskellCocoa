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


HsPtr hns_ButtonCreate()
{
    NSButton* button = [[NSButton alloc] init];
    hns_retain(button);
    return (__bridge HsPtr)(button);
}



void hns_Button_setTitle(HsPtr button, char* title)
{
    NSButton* pButton = (__bridge NSButton*)button;
    [pButton setTitle:[NSString stringWithUTF8String:title]];
}



void hns_Button_setBezelStyle(HsPtr button, HsWord64 style)
{
    NSButton* pButton = (__bridge NSButton*)button;
    [pButton setBezelStyle:(NSBezelStyle)style];

}
