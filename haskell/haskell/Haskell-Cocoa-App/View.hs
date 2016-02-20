
{-# LANGUAGE ForeignFunctionInterface #-}




module View where


import Foreign

import Cocoa.Runtime.HNSObject
import Cocoa.Foundation.HNSGeometry

import Cocoa.AppKit.HNSView
import Cocoa.AppKit.HNSViewController
import Cocoa.AppKit.HNSControl
import Cocoa.AppKit.HNSButton
import Cocoa.AppKit.HNSApp
import Cocoa.AppKit.HNSAlert 




buttonFrame :: Double -> Double ->      -- button size
               HNSRect ->               -- view frame
               HNSRect

buttonFrame btnW btnH (HNSRect _ _ w _) =
                let x' = (w - btnW - 10)
                    y' = 10
                in
                    (HNSRect x' y' btnW btnH)




view_drawRect :: Ptr HNSViewObj -> Double -> Double -> Double -> Double -> IO ()

view_drawRect view x y w h = 
                            do
                                viewFrame <- nsView_frame view
                                button <- view_userButton view
                                nsView_setFrame button (buttonFrame 100.0 30.0 viewFrame)
                                




foreign import ccall view_setUserButton :: Ptr HNSViewObj -> Ptr HNSButtonObj -> IO ()
foreign import ccall view_userButton :: Ptr HNSViewObj -> IO (Ptr HNSButtonObj)

foreign export ccall view_drawRect :: Ptr HNSViewObj -> Double -> Double -> Double -> Double -> IO ()

