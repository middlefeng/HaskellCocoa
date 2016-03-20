
{-# LANGUAGE ForeignFunctionInterface #-}




module View where


import Foreign

import AppFoundation.HModelUndoRedo
import Cocoa.Foundation.HNSGeometry

import Cocoa.Runtime.HNSObject
import Cocoa.AppKit.HNSView
import Cocoa.AppKit.HNSScrollView

import Model
import Canvas




data ViewObj


instance HNSView ViewObj where
instance HNSObject ViewObj where





view_addProgram :: Ptr ViewObj -> IO ()

view_addProgram view =
    do
        scrollView <- nsScrollViewCreate
        view_setScrollView view scrollView
        nsView_addSubview view scrollView

        canvas <- canvasCreate
        canvas_setZoomLevel canvas 2.0
        nsScrollView_setDocumentView scrollView canvas

        nsRelease scrollView
        nsRelease canvas





view_layoutSubViews :: Ptr ViewObj -> Double -> Double -> IO ()

view_layoutSubViews view w h =
    do
        appModelQuery layout where
            layout :: AppModel -> IO ()
            layout model =
                do
                    scrollView <- view_scrollView view
                    nsView_setFrame scrollView (HNSRect 1 1 (w - 1) (h - 1))
                    nsScrollView_setHasHorizontalScroller scrollView True
                    nsScrollView_setHasVerticalScroller scrollView True

                    let snapshot = historyModelCurrent model
                    let (CanvasSize canW canH) = modelSize snapshot

                    canvas <- (nsScrollView_documentView scrollView :: IO (Ptr CanvasObj))
                    zoomLevel <- canvas_zoomLevel canvas
                    nsView_setFrame canvas (HNSRect 0 0 (canW * zoomLevel) (canH * zoomLevel))
                    





view_drawRect :: Ptr ViewObj -> Double -> Double -> Double -> Double -> IO ()

view_drawRect view _ _ _ _ =
    do
        (HNSRect _ _ w h) <- nsView_frame view
        view_layoutSubViews view w h









view_mouseDown :: Ptr ViewObj -> Double -> Double -> IO ()

view_mouseDown _ _ _ = do return ()






foreign import ccall view_setScrollView :: Ptr ViewObj -> Ptr HNSScrollViewObj -> IO ()
foreign import ccall view_scrollView :: Ptr ViewObj -> IO (Ptr HNSScrollViewObj)



foreign export ccall view_drawRect :: Ptr ViewObj -> Double -> Double -> Double -> Double -> IO ()
foreign export ccall view_mouseDown :: Ptr ViewObj -> Double -> Double -> IO ()


