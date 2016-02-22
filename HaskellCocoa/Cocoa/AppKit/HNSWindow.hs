


{-# LANGUAGE ForeignFunctionInterface #-}



module Cocoa.AppKit.HNSWindow
(
    HNSWindow
,   HNSWindowObj
)
where


import Cocoa.Runtime.HNSObject





class (HNSObject a) => HNSWindow a where




data HNSWindowObj


instance HNSObject HNSWindowObj where
instance HNSWindow HNSWindowObj where


