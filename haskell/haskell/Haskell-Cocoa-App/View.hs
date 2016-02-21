
{-# LANGUAGE ForeignFunctionInterface #-}




module View where


import Foreign

import Cocoa.Foundation.HNSGeometry

import Cocoa.AppKit.HNSView
import Cocoa.AppKit.HNSButton
import Cocoa.AppKit.HNSColor
import Cocoa.AppKit.HNSBezierPath





buttonFrame :: Double -> Double ->      -- button size
               HNSRect ->               -- view frame
               HNSRect

buttonFrame btnW btnH (HNSRect _ _ w _) =
                let x' = (w - btnW - 10)
                    y' = 10
                in
                    (HNSRect x' y' btnW btnH)




view_drawRect :: Ptr HNSViewObj -> Double -> Double -> Double -> Double -> IO ()

view_drawRect view _ _ _ _ = 
                        let inSet :: HNSRect -> Double -> HNSRect
                            inSet (HNSRect x' y' w' h') i = (HNSRect (x' + i) (y' + i) (w' - i * 2.0) (h' - i * 2.0)) in
                            do
                                viewFrame <- nsView_frame view
                                button <- view_userButton view
                                nsView_setFrame button (buttonFrame 100.0 30.0 viewFrame)

                                color <- nsColorCreate 0.2 0.2 0.2 1.0
                                nsColor_set color
                                path <- nsBezierPathWithRoundedRect (inSet viewFrame 20) 5 5
                                nsBezierPath_strok path



foreign import ccall view_setUserButton :: Ptr HNSViewObj -> Ptr HNSButtonObj -> IO ()
foreign import ccall view_userButton :: Ptr HNSViewObj -> IO (Ptr HNSButtonObj)

foreign export ccall view_drawRect :: Ptr HNSViewObj -> Double -> Double -> Double -> Double -> IO ()

