


{-# LANGUAGE ForeignFunctionInterface #-}



module AppFoundation.HModelUndoRedo
(
    HistoryModel(..)
,   modelHistoryStart
,   modelCanUndo
,   modelUpdateUndo
,   modelCanRedo
,   modelUpdateRedo
,   modelAppend
)
where



import Data.List.NonEmpty



data HistoryModel a = HistoryModel
        {
            historyModelCurrent :: a
        ,   historyModelPrev :: Maybe (HistoryModel a)
        ,   historyModelNext :: Maybe (HistoryModel a)
        }



modelUpdateUndo :: HistoryModel a -> HistoryModel a
modelUpdateUndo m =
    case (historyModelPrev m) of
        Nothing -> m
        Just prev ->
            HistoryModel {
                             historyModelCurrent = historyModelCurrent prev
                         ,   historyModelPrev = historyModelPrev prev
                         ,   historyModelNext = Just m
                         }


modelCanUndo :: HistoryModel a -> Bool
modelCanUndo m = case (historyModelPrev m) of Nothing -> False
                                              _       -> True




modelUpdateRedo :: HistoryModel a -> HistoryModel a
modelUpdateRedo m =
    case (historyModelNext m) of
        Nothing -> m
        Just next ->
            HistoryModel {
                             historyModelCurrent = historyModelCurrent next
                         ,   historyModelPrev = Just m
                         ,   historyModelNext = historyModelNext next
                         }


modelCanRedo :: HistoryModel a -> Bool
modelCanRedo m = case (historyModelNext m) of Nothing -> False
                                              _       -> True




modelAppend :: HistoryModel a -> a -> HistoryModel a
modelAppend model a = reversedListToModel (a :| ((toList . modelToReversedList) model))
                            where

                                modelToReversedList :: HistoryModel a -> NonEmpty a
                                modelToReversedList model' =
                                    case historyModelPrev model' of
                                        Nothing -> (historyModelCurrent model') :| []
                                        Just m  -> (historyModelCurrent model') :| ((toList . modelToReversedList) m)

                                reversedListToModel :: NonEmpty a -> HistoryModel a
                                reversedListToModel (a' :| []) =
                                                                HistoryModel
                                                                {
                                                                    historyModelCurrent = a'
                                                                ,   historyModelPrev = Nothing
                                                                ,   historyModelNext = Nothing
                                                                }
                                reversedListToModel (a' :| (x:xs)) = 
                                                                HistoryModel
                                                                {
                                                                    historyModelCurrent = a'
                                                                ,   historyModelPrev = Just (reversedListToModel (x :| xs))
                                                                ,   historyModelNext = Nothing
                                                                }

                                    



modelHistoryStart :: a -> HistoryModel a
modelHistoryStart a = HistoryModel  {
                                        historyModelCurrent = a
                                    ,   historyModelPrev = Nothing
                                    ,   historyModelNext = Nothing   
                                    }




