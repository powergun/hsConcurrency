module Main where

import           Control.Parallel.Strategies

f :: Int -> Int
f n | n <= 0 = 0
    | n == 1 = 1
    | otherwise = f (n - 1) + f (n - 2)

main :: IO ()
main = do
  let result = runEval $ do
        -- para and con in haskell L532
        a <- rpar (show . f $ 41)
        b <- rpar (show . f $ 30)
        -- c <- rpar (show . f $ 39)
        -- d <- rpar (show . f $ 40)
        rseq a
        rseq b
        -- rseq c
        -- rseq d
        return (a, b)
  print result

