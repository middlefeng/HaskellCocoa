
{-# LANGUAGE ForeignFunctionInterface #-}




module Model
(
    AppModel
,   MousePos(..)
,   appModelInit
,   appModelUpdate
,   appModelQuery
,   appModelUndo
,   appModelRedo
)
where



import AppFoundation.HModel
import AppFoundation.HModelUndoRedo



data MousePos = MousePos Double Double
type AppModel = HistoryModel MousePos




appModelName :: String
appModelName = "default"




appModelInit :: AppModel -> IO ()
appModelInit m = modelInit m appModelName



appModelUpdate :: (AppModel -> AppModel) -> IO ()
appModelUpdate m = modelUpdate m appModelName



appModelQuery :: (AppModel -> IO ()) -> IO ()
appModelQuery m = modelQuery m appModelName



appModelUndo :: AppModel -> AppModel
appModelUndo = modelUpdateUndo



appModelRedo :: AppModel -> AppModel
appModelRedo = modelUpdateRedo




