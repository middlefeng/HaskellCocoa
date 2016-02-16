


{-# LANGUAGE ForeignFunctionInterface #-}



module HNSButton
(
    HNSButton
,   HNSButtonObj
,   nsButtonCreate
,   nsButton_setTitle
)
where


import Foreign
import Foreign.C.String
import HNSObject
import HNSView



class (HNSView a) => HNSButton a where

    nsButton_setTitle :: Ptr a -> String -> IO ()

    nsButton_setTitle button title =
                do
                    withCString title (\s -> hns_Button_setTitle button s)




data HNSButtonObj = HNSButtonObj


instance HNSObject HNSButtonObj where
instance HNSView HNSButtonObj where
instance HNSButton HNSButtonObj where




nsButtonCreate :: IO (Ptr HNSButtonObj)
nsButtonCreate = hns_ButtonCreate



foreign import ccall hns_ButtonCreate :: IO (Ptr a)
foreign import ccall hns_Button_setTitle :: Ptr a -> CString -> IO ()




