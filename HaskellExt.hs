
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



foreign import ccall createPoint :: Int -> Ptr Int
foreign import ccall triple_p :: Ptr Int -> IO Int

foreign export ccall triple :: Int -> IO Int
foreign export ccall showTripe :: Int -> IO ()
