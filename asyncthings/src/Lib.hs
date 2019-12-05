module Lib
    ( someFunc
    ) where

import           Control.Concurrent.Async

someFunc :: IO ()
someFunc = putStrLn "someFunc"
