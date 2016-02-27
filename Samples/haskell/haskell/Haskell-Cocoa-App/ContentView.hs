
{-# LANGUAGE ForeignFunctionInterface #-}




module ContentView where


import Foreign
import Cocoa.Runtime.HNSObject
import Cocoa.AppKit.HNSView



data ContentViewObj


instance HNSObject ContentViewObj where
instance HNSView ContentViewObj where



foreign import ccall contentViewCreate :: IO (Ptr ContentViewObj)
