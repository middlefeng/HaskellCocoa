
{-# LANGUAGE ForeignFunctionInterface #-}




module Model
(
    AppModel(..)
,   MousePos(..)
,   appModelInit
,   appModelUpdate
,   appModelQuery
)
where



import AppFoundation.HModel



data MousePos = MousePos Double Double
data AppModel = AppModel MousePos




appModelName :: String
appModelName = "default"




appModelInit :: AppModel -> IO ()
appModelInit m = modelInit m appModelName



appModelUpdate :: (AppModel -> AppModel) -> IO ()
appModelUpdate m = modelUpdate m appModelName



appModelQuery :: (AppModel -> IO ()) -> IO ()
appModelQuery m = modelQuery m appModelName

