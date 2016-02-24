


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

    nsControl_setAction :: Ptr a ->                            -- sender                               
                           FunPtr (Ptr a -> IO ()) ->          -- action
                           IO ()

    nsControl_setAction = hns_control_setAction



foreign import ccall hns_control_setAction :: Ptr a -> FunPtr (Ptr a -> IO ()) -> IO ()


