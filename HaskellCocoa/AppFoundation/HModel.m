//
//  HModel.m
//  
//
//  Created by middleware on 2/13/16.
//
//


#import "HModel.h"


@interface HModel()

@property (nonatomic, strong) NSMutableDictionary* hsModels;

@end



@implementation HModel

@end



HModel* sModel;



void h_model_init(HsStablePtr model, const char* name)
{
    if (!sModel)
        sModel = [[HModel alloc] init];
    if (!sModel.hsModels)
        sModel.hsModels = [[NSMutableDictionary alloc] init];
    
    NSString* nameStr = [NSString stringWithUTF8String:name];
    NSNumber* oldModel = sModel.hsModels[nameStr];
    if (oldModel)
    {
        HsStablePtr pModel = (HsStablePtr)[oldModel longLongValue];
        hs_free_stable_ptr(pModel);
    }
    
    NSNumber* newModel = [NSNumber numberWithLongLong:(long long)model];
    [sModel.hsModels setObject:newModel forKey:nameStr];
}


void h_model_destroy(const char* name)
{
    NSString* nameStr = [NSString stringWithUTF8String:name];
    NSNumber* asModel = sModel.hsModels[nameStr];
    HsStablePtr model = (HsStablePtr)asModel.longLongValue;
    
    hs_free_stable_ptr(model);
    [sModel.hsModels removeObjectForKey:nameStr];
}



typedef HsStablePtr (*updateFunc_t)(HsStablePtr);


void h_model_update(HsFunPtr func, const char* name)
{
    updateFunc_t updateFunc = (updateFunc_t)func;
    
    NSString* nameStr = [NSString stringWithUTF8String:name];
    NSNumber* asModel = sModel.hsModels[nameStr];
    HsStablePtr model = (HsStablePtr)asModel.longLongValue;
    
    HsStablePtr newModel = updateFunc(model);
    hs_free_fun_ptr(func);
    hs_free_stable_ptr(model);
    
    asModel = [NSNumber numberWithLongLong:(long long)newModel];
    [sModel.hsModels setObject:asModel forKey:nameStr];
}


typedef void (*queryFunc_t)(HsStablePtr);



void h_model_query(HsFunPtr func, const char* name)
{
    NSString* nameStr = [NSString stringWithUTF8String:name];
    NSNumber* asModel = sModel.hsModels[nameStr];
    HsStablePtr model = (HsStablePtr)asModel.longLongValue;
    
    queryFunc_t queryFunc = (queryFunc_t)func;
    queryFunc(model);
    hs_free_fun_ptr(func);
}



