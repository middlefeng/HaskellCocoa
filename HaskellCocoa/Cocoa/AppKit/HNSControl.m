//
//  HNSObject.m
//  
//
//  Created by middleware on 2/13/16.
//
//

#import <AppKit/AppKit.h>

#import "HNSObject.h"
#import "HNSControl.h"


typedef void (*HsAction)(HsPtr control);



@interface HNSControlTarget : NSObject

@property (assign, nonatomic) HsFunPtr hsAction;
@property (strong, nonatomic) id controlTarget;

- (void)actionFunc:(id)sender;

@end



@implementation HNSControlTarget

- (void)actionFunc:(id)sender
{
    HsAction pAction = (HsAction)_hsAction;
    pAction((__bridge HsPtr)sender);
}

- (void)dealloc
{
    hs_free_fun_ptr(_hsAction);
}

@end



void hns_control_removeAction(HsPtr control);



void hns_control_setAction(HsPtr control, HsFunPtr action)
{
    hns_control_removeAction(control);
    
    NSControl* pControl = (__bridge NSControl*)control;
    HNSControlTarget* target = [HNSControlTarget new];
    target.hsAction = action;
    hns_retain(target);
    
    pControl.target = target;
    pControl.action = @selector(actionFunc:);
}


void hns_control_removeAction(HsPtr control)
{
    NSControl* pControl = (__bridge NSControl*)control;
    id oldTarget = pControl.target;
    if (oldTarget)
        hns_release(oldTarget);
}

