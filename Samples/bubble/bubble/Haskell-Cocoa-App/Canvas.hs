
{-# LANGUAGE ForeignFunctionInterface #-}




module Canvas
(
    CanvasObj
,   canvasCreate
)
where


import Foreign

import AppFoundation.HModelUndoRedo
import Cocoa.Foundation.HNSGeometry
import Cocoa.Runtime.HNSObject
import Cocoa.AppKit.HNSView
import Cocoa.AppKit.HNSColor
import Cocoa.AppKit.HNSBezierPath

import Model




data CanvasObj


instance HNSView CanvasObj where
instance HNSObject CanvasObj where




canvas_showBubbles :: [Bubble] -> IO ()

canvas_showBubbles []     = return ()
canvas_showBubbles (x:xs) = canvas_showBubble x >> canvas_showBubbles xs where
                            canvas_showBubble :: Bubble -> IO ()
                            canvas_showBubble (Bubble r (BubbleLocation x' y') selected) =
                                do
                                    color <- nsColorCreate 0.2 0.2 0.2 1.0
                                    nsColor_set color

                                    bizerPath <- nsBezierPathWithOvalInRect bubbleRect
                                    nsBezierPath_setLineWidth bizerPath brushWidth
                                    nsBezierPath_strok bizerPath

                                        where
                                            bubbleRect = (HNSRect (x' - r) (y' - r) (r * 2.0) (r * 2.0))
                                            brushWidth = case selected of
                                                            True -> 3.0
                                                            False -> 1.0




canvas_drawRect :: Ptr CanvasObj -> Double -> Double -> Double -> Double -> IO ()

canvas_drawRect _ _ _ _ _ =
    do
        appModelQuery layout where
            layout :: AppModel -> IO ()
            layout model =
                do
                    let snapshot = historyModelCurrent model
                    canvas_showBubbles (modelEntities snapshot)




foreign import ccall canvasCreate :: IO (Ptr CanvasObj)

foreign export ccall canvas_drawRect :: Ptr CanvasObj -> Double -> Double -> Double -> Double -> IO ()


