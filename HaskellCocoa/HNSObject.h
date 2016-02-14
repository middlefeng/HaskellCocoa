//
//  HNSObject.h
//  
//
//  Created by middleware on 2/13/16.
//
//

#import <Foundation/Foundation.h>

#include "HsFFI.h"


extern void hns_init();
extern void hns_retain(id obj);
extern void hns_release(id obj);

extern void ns_retain(HsPtr obj);
extern void ns_release(HsPtr obj);
