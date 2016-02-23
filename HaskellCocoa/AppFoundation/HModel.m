//
//  HModel.m
//  
//
//  Created by middleware on 2/13/16.
//
//


#import "HModel.h"


@interface HModel()

@property (nonatomic, assign) HsStablePtr model;

@end



@implementation HModel

@end



HModel* sModel;



void h_model_init(HsStablePtr model)
{
    sModel = [[HModel alloc] init];
    sModel.model = model;
}


typedef HsStablePtr (*updateFunc_t)(HsStablePtr);


void h_model_update(HsFunPtr func)
{
    updateFunc_t updateFunc = (updateFunc_t)func;
    
    HsStablePtr newModel = updateFunc(sModel.model);
    hs_free_fun_ptr(func);
    hs_free_stable_ptr(sModel.model);
    sModel.model = newModel;
}


typedef void (*queryFunc_t)(HsStablePtr);



void h_model_query(HsFunPtr func)
{
    queryFunc_t queryFunc = (queryFunc_t)func;
    queryFunc(sModel.model);
    hs_free_fun_ptr(func);
}



