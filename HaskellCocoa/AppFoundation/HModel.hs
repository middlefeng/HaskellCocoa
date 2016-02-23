


{-# LANGUAGE ForeignFunctionInterface #-}



module AppFoundation.HModel
(
    modelInit
,   modelUpdate
,   modelQuery
)
where


import Foreign


foreign import ccall "wrapper" mkFreeFunPtr :: (StablePtr a -> IO (StablePtr a)) ->
                                                IO (FunPtr (StablePtr a -> IO (StablePtr a)))

foreign import ccall "wrapper" mkFreeFunQueryPtr :: (StablePtr a -> IO ()) ->
                                                IO (FunPtr (StablePtr a -> IO ()))


foreign import ccall h_model_init :: StablePtr a -> IO ()
foreign import ccall h_model_update :: FunPtr (StablePtr a -> IO (StablePtr a)) -> IO ()
foreign import ccall h_model_query :: FunPtr (StablePtr a -> IO ()) -> IO ()


modelInit :: a -> IO ()
modelInit a = 
    do
        p <- newStablePtr a
        h_model_init p



modelUpdate :: (a -> a) -> IO ()
modelUpdate f =
        let f' p =
                do
                    a <- deRefStablePtr p
                    let b = f a
                    newStablePtr b
            in do
                func <- mkFreeFunPtr f'
                h_model_update func



modelQuery :: (a -> IO ()) -> IO ()
modelQuery f =
        let f' p =
                do
                    a <- deRefStablePtr p
                    f a
            in do
                func <- mkFreeFunQueryPtr f'
                h_model_query func




