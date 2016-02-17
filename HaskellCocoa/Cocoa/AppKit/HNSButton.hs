


{-# LANGUAGE ForeignFunctionInterface #-}



module Cocoa.AppKit.HNSButton
(
    HNSButton
,   HNSButtonObj
,   nsButtonCreate
,   nsButton_setTitle
)
where


import Foreign
import Foreign.C.String
import Cocoa.AppKit.HNSObject
import Cocoa.AppKit.HNSView



class (HNSView a) => HNSButton a where

    nsButton_setTitle :: Ptr a -> String -> IO ()

    nsButton_setTitle button title =
                do
                    withCString title (\s -> hns_Button_setTitle button s)




data HNSButtonObj


instance HNSObject HNSButtonObj where
instance HNSView HNSButtonObj where
instance HNSButton HNSButtonObj where




nsButtonCreate :: IO (Ptr HNSButtonObj)
nsButtonCreate = hns_ButtonCreate



foreign import ccall hns_ButtonCreate :: IO (Ptr a)
foreign import ccall hns_Button_setTitle :: Ptr a -> CString -> IO ()




