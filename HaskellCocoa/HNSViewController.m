//
//  HNSViewController.m
//  
//
//  Created by middleware on 2/13/16.
//
//

#import "HNSViewController.h"



HsPtr nsViewController_view(HsPtr viewController)
{
    NSViewController* pVC = (__bridge NSViewController*)viewController;
    return (__bridge HsPtr)(pVC.view);
}