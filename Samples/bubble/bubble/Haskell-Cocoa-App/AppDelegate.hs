
{-# LANGUAGE ForeignFunctionInterface #-}




module AppDelegate
(
    AppDelegateObj
,   appDelegate_undo
,   appDelegate_redo
)
where


import Foreign
import Cocoa.AppKit.HNSMenuItem
import Model


data AppDelegateObj



appDelegate_applicationWillFinishLaunching :: IO ()

appDelegate_applicationWillFinishLaunching =
    do
        -- TODO: debug model
        let bubble1 = Bubble 5 (BubbleLocation 10 10) False
        let bubble2 = Bubble 20 (BubbleLocation 50 50) True
        let snapshot = AppModelSnapshot (CanvasSize 800 800) [bubble1, bubble2]

        appModelInit snapshot





foreign export ccall appDelegate_applicationWillFinishLaunching :: IO ()


foreign import ccall appDelegate_undo :: Ptr AppDelegateObj -> IO (Ptr HNSMenuItemObj)
foreign import ccall appDelegate_redo :: Ptr AppDelegateObj -> IO (Ptr HNSMenuItemObj)


