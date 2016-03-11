
{-# LANGUAGE ForeignFunctionInterface #-}




module Model
(
    AppModel
,   AppModelSnapshot(..)
,   CanvasSize(..)
,   Bubble(..)
,   Radius
,   BubbleLocation(..)
,   appModelInit
,   appModelUpdate
,   appModelQuery
,   appModelUndo
,   appModelRedo
)
where



import AppFoundation.HModel
import AppFoundation.HModelUndoRedo



data CanvasSize = CanvasSize Double Double

data Bubble = Bubble Radius BubbleLocation Selected

type Radius = Double
type Selected = Bool
data BubbleLocation = BubbleLocation Double Double

data AppModelSnapshot = AppModelSnapshot
                {
                    modelSize :: CanvasSize
                ,   modelEntities :: [Bubble]
                }

type AppModel = HistoryModel AppModelSnapshot




appModelName :: String
appModelName = "default"




appModelInit :: AppModelSnapshot -> IO ()
appModelInit s = modelInit (HistoryModel s Nothing Nothing) appModelName



appModelUpdate :: (AppModel -> AppModel) -> IO ()
appModelUpdate m = modelUpdate m appModelName



appModelQuery :: (AppModel -> IO ()) -> IO ()
appModelQuery m = modelQuery m appModelName



appModelUndo :: AppModel -> AppModel
appModelUndo = modelUpdateUndo



appModelRedo :: AppModel -> AppModel
appModelRedo = modelUpdateRedo




