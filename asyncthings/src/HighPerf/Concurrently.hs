module HighPerf.Concurrently (demo) where

import           Control.Applicative
import           Control.Concurrent
import           Control.Concurrent.Async

lineOrTimeOut :: Concurrently (Either String ())
lineOrTimeOut =   Concurrently (fmap Left getLine)
              <|> Concurrently (fmap Right (threadDelay 5000000))

demo = runConcurrently lineOrTimeOut
