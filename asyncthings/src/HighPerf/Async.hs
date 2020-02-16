module HighPerf.Async (concise) where

import           Control.Concurrent
import           Control.Concurrent.Async
import           Control.Monad            (forever)

concise = forever $ do
  res <- getLine `race` threadDelay 1000000 -- 1 sec
  case res of
    Left input -> print input
    Right _    -> putStrLn "Timeout!"
