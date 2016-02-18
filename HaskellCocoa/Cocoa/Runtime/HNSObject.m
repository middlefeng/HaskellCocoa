//
//  HNSObject.m
//  
//
//  Created by middleware on 2/13/16.
//
//

#import "HNSObject.h"


static NSMutableDictionary* sHNSRoots;




void hns_init()
{
    sHNSRoots = [[NSMutableDictionary alloc] init];
}



void hns_retain(id obj)
{
    NSNumber* asKey = [NSNumber numberWithLongLong:(long long)obj];
    NSMutableArray* asValue = sHNSRoots[asKey];
    
    if (asValue) {
        [asValue addObject:obj];
    } else {
        asValue = [[NSMutableArray alloc] initWithObjects:obj, nil];
        [sHNSRoots setObject:asValue forKey:asKey];
    }
}



void hns_release(id obj)
{
    NSNumber* asKey = [NSNumber numberWithLongLong:(long long)obj];
    NSMutableArray* asValue = sHNSRoots[asKey];
    
    // detect over release
    assert(asValue);
    
    if (asValue.count == 1)
        [sHNSRoots removeObjectForKey:asKey];
    else
        [asValue removeLastObject];
}



void ns_retain(HsPtr obj)
{
    id pObj = (__bridge id)obj;
    hns_retain(pObj);
}



void ns_release(HsPtr obj)
{
    id pObj = (__bridge id)obj;
    hns_release(pObj);
}





