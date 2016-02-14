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
        [asValue addObject:asKey];
    } else {
        asValue = [[NSMutableArray alloc] initWithObjects:asKey, nil];
        [sHNSRoots setObject:obj forKey:asKey];
    }
}



void hns_release(id* obj)
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



