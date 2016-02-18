


{-# LANGUAGE ForeignFunctionInterface #-}



module Cocoa.AppKit.HNSControl
(
    HNSControl
,   nsControl_setAction
)
where


import Foreign
import Cocoa.AppKit.HNSObject
import Cocoa.AppKit.HNSView




class (HNSView a) => HNSControl a where

    nsControl_setAction :: (HNSObject b) => Ptr a ->                            -- sender                               
                                            FunPtr (
                                                        Ptr a ->    -- sender
                                                        Ptr b ->    -- target
                                                        IO ()
                                                    ) ->                        -- action
                                            IO ()

    nsControl_setAction = hns_control_setAction



foreign import ccall hns_control_setAction :: Ptr a -> FunPtr (Ptr a -> Ptr b -> IO ()) -> IO ()


