
{-# LANGUAGE ForeignFunctionInterface #-}


module HaskellExt where


import Foreign.Ptr


triple :: Int -> IO Int

triple x = return (x * 3)




createPoint :: Int -> Ptr Int



triple_p :: Ptr Int -> IO Int



showTripe :: Int -> IO ()

showTripe x = do
                result <- (triple_p (createPoint x))
                putStrLn $ show result




showAlertHaskell :: IO ()

showAlertHaskell = do showAlert



completeHandler :: IO ()

completeHandler = putStrLn "Complete"








foreign import ccall createPoint :: Int -> Ptr Int
foreign import ccall triple_p :: Ptr Int -> IO Int

foreign import ccall showAlert :: IO ()
foreign export ccall completeHandler :: IO ()

foreign export ccall triple :: Int -> IO Int
foreign export ccall showTripe :: Int -> IO ()
foreign export ccall showAlertHaskell :: IO ()
