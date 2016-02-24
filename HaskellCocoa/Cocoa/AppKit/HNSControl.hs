


{-# LANGUAGE ForeignFunctionInterface #-}



module Cocoa.AppKit.HNSControl
(
    HNSControl
,   nsControl_setAction
)
where


import Foreign
import Cocoa.Runtime.HNSObject
import Cocoa.AppKit.HNSView




class (HNSView a) => HNSControl a where

    nsControl_setAction :: (HNSObject b) => Ptr a ->                            -- sender
                                            Ptr b ->                            -- target
                                            FunPtr (Ptr a -> Ptr b -> IO ()) -> -- action
                                            IO ()

    nsControl_setAction = hns_control_setAction



foreign import ccall hns_control_setAction :: Ptr a -> Ptr b -> FunPtr (Ptr a -> Ptr b -> IO ()) -> IO ()


