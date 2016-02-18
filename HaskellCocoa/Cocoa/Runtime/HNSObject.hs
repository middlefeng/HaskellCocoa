

{-# LANGUAGE ForeignFunctionInterface #-}


module Cocoa.Runtime.HNSObject
(
    HNSObject
,	nsRetain
,	nsRelease
)
where



import Foreign


class HNSObject a where

    nsRetain :: Ptr a -> IO ()
    nsRetain = ns_retain

    nsRelease :: Ptr a -> IO ()
    nsRelease = ns_release





foreign import ccall ns_retain :: Ptr a -> IO ()
foreign import ccall ns_release :: Ptr a -> IO ()


