


{-# LANGUAGE ForeignFunctionInterface #-}



module HNSButton
(
    HNSButton
,   HNSButtonObj
,   nsButtonCreate
)
where


import Foreign
import HNSObject
import HNSView



class (HNSView a) => HNSButton a where



data HNSButtonObj = HNSButtonObj


instance HNSObject HNSButtonObj where
instance HNSView HNSButtonObj where
instance HNSButton HNSButtonObj where


	

nsButtonCreate :: IO (Ptr HNSButtonObj)
nsButtonCreate = hns_buttonCreate





foreign import ccall hns_buttonCreate :: IO (Ptr a)




