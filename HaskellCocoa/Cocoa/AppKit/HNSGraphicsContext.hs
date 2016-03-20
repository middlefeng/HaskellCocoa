


{-# LANGUAGE ForeignFunctionInterface #-}



module Cocoa.AppKit.HNSGraphicsContext
(
    HNSGraphicsContextObj
,   nsGraphicsContext_currentContext
,   nsGraphicsContext_saveGraphicsState
,   nsGraphicsContext_restoreGraphicsState
)
where



import Foreign
import Cocoa.Runtime.HNSObject



data HNSGraphicsContextObj;

instance HNSObject HNSGraphicsContextObj where



nsGraphicsContext_currentContext :: IO (Ptr HNSGraphicsContextObj)
nsGraphicsContext_currentContext = hns_graphicsContext_currentContext


nsGraphicsContext_saveGraphicsState :: Ptr HNSGraphicsContextObj -> IO ()
nsGraphicsContext_saveGraphicsState = hns_graphicsContext_saveGraphicsState



nsGraphicsContext_restoreGraphicsState :: Ptr HNSGraphicsContextObj -> IO ()
nsGraphicsContext_restoreGraphicsState = hns_graphicsContext_restoreGraphicsState




foreign import ccall hns_graphicsContext_currentContext :: IO (Ptr HNSGraphicsContextObj)
foreign import ccall hns_graphicsContext_saveGraphicsState :: Ptr HNSGraphicsContextObj -> IO ()
foreign import ccall hns_graphicsContext_restoreGraphicsState :: Ptr HNSGraphicsContextObj -> IO ()




