//
//  HNSObject.m
//  
//
//  Created by middleware on 2/13/16.
//
//

#import <AppKit/AppKit.h>

#import "HNSObject.h"


typedef void (*HsAction)(HsPtr menuItem, HsPtr target);


@interface HNSMenuItemTarget : NSObject

@property (assign, nonatomic) HsFunPtr hsAction;
@property (assign, nonatomic) HsPtr hsTarget;
@property (strong, nonatomic) id menuItemTarget;

- (void)actionFunc:(id)sender;

@end



@implementation HNSMenuItemTarget

- (void)actionFunc:(id)sender
{
    HsAction pAction = (HsAction)_hsAction;
    pAction((__bridge HsPtr)sender, _hsTarget);
}

- (void)dealloc
{
    hs_free_fun_ptr(_hsAction);
}

@end




void hns_menuItem_removeAction(HsPtr menuItem);

void hns_menuItem_setAction(HsPtr menuItem, HsPtr hsTarget, HsFunPtr action)
{
    hns_menuItem_removeAction(menuItem);
    
    NSMenuItem* pItem = (__bridge NSMenuItem*)menuItem;
    HNSMenuItemTarget* target = [HNSMenuItemTarget new];
    target.hsAction = action;
    target.hsTarget = hsTarget;
    hns_retain(target);
    
    pItem.target = target;
    pItem.action = @selector(actionFunc:);
}


void hns_menuItem_removeAction(HsPtr menuItem)
{
    NSMenuItem* pItem = (__bridge NSMenuItem*)menuItem;
    id oldTarget = pItem.target;
    
    pItem.target = nil;
    pItem.action = nil;
    
    if (oldTarget)
        hns_release(oldTarget);
}



