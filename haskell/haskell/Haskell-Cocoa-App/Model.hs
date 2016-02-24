
{-# LANGUAGE ForeignFunctionInterface #-}




module Model
(
    AppModel(..)
,   MousePos(..)
,   appModelInit
,   appModelUpdate
,   appModelQuery
,   appModelUndo
,   appModelRedo
)
where



import AppFoundation.HModel



type AppModelPrev = Maybe AppModel
type AppModelNext = Maybe AppModel


data MousePos = MousePos Double Double
data AppModel = AppModel MousePos AppModelPrev AppModelNext




appModelName :: String
appModelName = "default"




appModelInit :: AppModel -> IO ()
appModelInit m = modelInit m appModelName



appModelUpdate :: (AppModel -> AppModel) -> IO ()
appModelUpdate m = modelUpdate m appModelName



appModelQuery :: (AppModel -> IO ()) -> IO ()
appModelQuery m = modelQuery m appModelName



appModelUndo :: AppModel -> AppModel
appModelUndo m@(AppModel _ Nothing _) = m
appModelUndo m@(AppModel _ (Just (AppModel c' p' _)) _) = AppModel c' p' (Just m)



appModelRedo :: AppModel -> AppModel
appModelRedo m@(AppModel _ _ Nothing) = m
appModelRedo m@(AppModel _ _ (Just (AppModel c' _ n'))) = AppModel c' (Just m) n'




