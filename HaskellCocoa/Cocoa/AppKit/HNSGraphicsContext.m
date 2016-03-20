//
//  HNSGraphicsContext.m
//
//
//  Created by middleware on 3/13/16.
//
//


#import "HNSGraphicsContext.h"


HsPtr hns_graphicsContext_currentContext(void)
{
    id context = [NSGraphicsContext currentContext];
    return (__bridge HsPtr)context;
}


void hns_graphicsContext_saveGraphicsState(HsPtr context)
{
    NSGraphicsContext* pContext = (__bridge NSGraphicsContext*)context;
    [pContext saveGraphicsState];
}



void hns_graphicsContext_restoreGraphicsState(HsPtr context)
{
    NSGraphicsContext* pContext = (__bridge NSGraphicsContext*)context;
    [pContext restoreGraphicsState];
}

