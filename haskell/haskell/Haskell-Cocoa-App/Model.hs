
{-# LANGUAGE ForeignFunctionInterface #-}




module Model
(
    AppModel(..)
,   MousePos(..)
,   appModelInit
,   appModelUpdate
)
where



import AppFoundation.HModel



data MousePos = MousePos Double Double
data AppModel = AppModel MousePos




appModelInit :: AppModel -> IO ()
appModelInit = modelInit



appModelUpdate :: (AppModel -> AppModel) -> IO ()
appModelUpdate = modelUpdate

