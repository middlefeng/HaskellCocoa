
{-# LANGUAGE ForeignFunctionInterface #-}




module View where


import Foreign

import Cocoa.Foundation.HNSGeometry

import Cocoa.AppKit.HNSView
import Cocoa.AppKit.HNSScrollView
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





scrollViewFrame :: Double -> Double -> HNSRect

scrollViewFrame w h = (HNSRect inset (inset + offset) (w - inset * 2.0) (h - inset * 2.0 - offset)) where
                            inset = 40
                            offset = 30






view_drawRect :: Ptr HNSViewObj -> Double -> Double -> Double -> Double -> IO ()

view_drawRect view _ _ _ _ = 
                        let inSet :: HNSRect -> Double -> HNSRect
                            inSet (HNSRect x' y' w' h') i = (HNSRect (x' + i) (y' + i + offset)
                                                                     (w' - i * 2.0) (h' - i * 2.0 - offset))
                                                                where offset = 30.0

                            -- center (HNSRect x' y' w' h') = (x' + w' / 2.0, y' + h' / 2.0
                        in

                            do
                                viewFrame <- nsView_frame view
                                button <- view_userButton view
                                nsView_setFrame button (buttonFrame 100.0 30.0 viewFrame)

                                let (HNSRect _ _ w h) = viewFrame
                                scrollView <- view_scrollView view
                                nsView_setFrame scrollView (scrollViewFrame w h)

                                color <- nsColorCreate 0.2 0.2 0.2 1.0
                                nsColor_set color
                                path <- nsBezierPathWithRoundedRect (inSet viewFrame 20) 5 5
                                nsBezierPath_setLineWidth path 3.0
                                nsBezierPath_strok path

                                {-
                                liveResize <- nsView_inLiveResize view
                                if liveResize
                                    then
                                        do
                                            let f _ = (AppModel (MousePos cx cy)) where (cx, cy) = center viewFrame
                                            appModelUpdate f
                                    else
                                        appModelUpdate id
                                -}






foreign import ccall view_setUserButton :: Ptr HNSViewObj -> Ptr HNSButtonObj -> IO ()
foreign import ccall view_userButton :: Ptr HNSViewObj -> IO (Ptr HNSButtonObj)

foreign import ccall view_setScrollView :: Ptr HNSViewObj -> Ptr HNSScrollViewObj -> IO ()
foreign import ccall view_scrollView :: Ptr HNSViewObj -> IO (Ptr HNSScrollViewObj)

foreign export ccall view_drawRect :: Ptr HNSViewObj -> Double -> Double -> Double -> Double -> IO ()

