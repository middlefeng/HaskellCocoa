
{-# LANGUAGE ForeignFunctionInterface #-}




module AppDelegate
(
    AppDelegate
,   appDelegate_undo
,   appDelegate_redo
)
where


import Foreign
import Cocoa.AppKit.HNSMenuItem


data AppDelegate


foreign import ccall appDelegate_undo :: Ptr AppDelegate -> IO (Ptr HNSMenuItemObj)
foreign import ccall appDelegate_redo :: Ptr AppDelegate -> IO (Ptr HNSMenuItemObj)


