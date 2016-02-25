


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




data NonEmptyList a = NonEmptyList
                            {
                                nonEmptyListHead :: a
                            ,   nonEmptyListRest :: [a]
                            }


nonEmptyListToOrdinary :: NonEmptyList a -> [a]
nonEmptyListToOrdinary (NonEmptyList x xs) = x:xs



modelAppend :: HistoryModel a -> a -> HistoryModel a
modelAppend model a = reversedListToModel (NonEmptyList a ((nonEmptyListToOrdinary . modelToReversedList) model))
                            where

                                modelToReversedList :: HistoryModel a -> NonEmptyList a
                                modelToReversedList model' =
                                    case historyModelPrev model' of
                                        Nothing -> NonEmptyList (historyModelCurrent model') []
                                        Just m  -> NonEmptyList (historyModelCurrent model') ((nonEmptyListToOrdinary . modelToReversedList) m)

                                reversedListToModel :: NonEmptyList a -> HistoryModel a
                                reversedListToModel (NonEmptyList a' []) =
                                                                HistoryModel
                                                                {
                                                                    historyModelCurrent = a'
                                                                ,   historyModelPrev = Nothing
                                                                ,   historyModelNext = Nothing
                                                                }
                                reversedListToModel (NonEmptyList a' (x:xs)) = 
                                                                HistoryModel
                                                                {
                                                                    historyModelCurrent = a'
                                                                ,   historyModelPrev = Just (reversedListToModel (NonEmptyList x xs))
                                                                ,   historyModelNext = Nothing
                                                                }

                                    



modelHistoryStart :: a -> HistoryModel a
modelHistoryStart a = HistoryModel  {
                                        historyModelCurrent = a
                                    ,   historyModelPrev = Nothing
                                    ,   historyModelNext = Nothing   
                                    }




