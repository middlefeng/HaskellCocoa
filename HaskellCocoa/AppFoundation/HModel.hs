


{-# LANGUAGE ForeignFunctionInterface #-}



module AppFoundation.HModel
(
    modelInit
,   modelDestroy
,   modelUpdate
,   modelQuery
)
where


import Foreign
import Foreign.C.String


foreign import ccall "wrapper" mkFreeFunPtr :: (StablePtr a -> IO (StablePtr a)) ->
                                                IO (FunPtr (StablePtr a -> IO (StablePtr a)))

foreign import ccall "wrapper" mkFreeFunQueryPtr :: (StablePtr a -> IO ()) ->
                                                IO (FunPtr (StablePtr a -> IO ()))


foreign import ccall h_model_init :: StablePtr a -> CString -> IO ()
foreign import ccall h_model_update :: FunPtr (StablePtr a -> IO (StablePtr a)) -> CString -> IO ()
foreign import ccall h_model_query :: FunPtr (StablePtr a -> IO ()) -> CString -> IO ()
foreign import ccall h_model_destroy :: CString -> IO ()


modelInit :: a -> String -> IO ()
modelInit a name = 
    do
        p <- newStablePtr a
        withCString name (\s -> h_model_init p s)



modelDestroy :: String -> IO ()
modelDestroy name = withCString name (\s -> h_model_destroy s)



modelUpdate :: (a -> a) -> String-> IO ()
modelUpdate f name =
        let f' p =
                do
                    a <- deRefStablePtr p
                    let b = f a
                    newStablePtr b
            in do
                func <- mkFreeFunPtr f'
                withCString name (\s -> h_model_update func s)



modelQuery :: (a -> IO ()) -> String -> IO ()
modelQuery f name =
        let f' p =
                do
                    a <- deRefStablePtr p
                    f a
            in do
                func <- mkFreeFunQueryPtr f'
                withCString name (\s -> h_model_query func s)




