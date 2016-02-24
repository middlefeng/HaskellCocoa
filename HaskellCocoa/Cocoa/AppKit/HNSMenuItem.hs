


{-# LANGUAGE ForeignFunctionInterface #-}



module Cocoa.AppKit.HNSMenuItem
(
    HNSMenuItem
,   HNSMenuItemObj
,   nsMenuItem_setAction
,   nsMenuItem_removeAction
)
where



import Foreign
import Cocoa.Runtime.HNSObject




class (HNSObject a) => HNSMenuItem a where

    nsMenuItem_setAction :: (HNSObject b) => Ptr a ->                            -- sender                               
                                             FunPtr (
                                                        Ptr a ->    -- sender
                                                        Ptr b ->    -- target
                                                        IO ()
                                                    ) ->                        -- action
                                             IO ()

    nsMenuItem_setAction = hns_menuItem_setAction


    nsMenuItem_removeAction :: Ptr a -> IO ()

    nsMenuItem_removeAction = hns_menuItem_removeAction






data HNSMenuItemObj;

instance HNSObject HNSMenuItemObj where
instance HNSMenuItem HNSMenuItemObj where



foreign import ccall hns_menuItem_setAction :: Ptr a -> FunPtr (Ptr a -> Ptr b -> IO ()) -> IO ()
foreign import ccall hns_menuItem_removeAction :: Ptr a -> IO ()






