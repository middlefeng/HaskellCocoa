
{-# LANGUAGE ForeignFunctionInterface #-}




module Canvas
(
    CanvasObj
,   canvasCreate
)
where


import Foreign

import Cocoa.Runtime.HNSObject
import Cocoa.AppKit.HNSView



data CanvasObj


instance HNSView CanvasObj where
instance HNSObject CanvasObj where




foreign import ccall canvasCreate :: IO (Ptr CanvasObj)
