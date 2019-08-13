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
        -- NOTE to set rts options, do:
        -- stack run par-simple --rts-options -N4
        -- (4 cores; see the difference in htop when given -N2)
        -- '-s' to profile
        -- NOTE: --profile will introduce massive slow down
        a <- rpar (show . f $ 41)
        b <- rpar (show . f $ 30)
        c <- rpar (show . f $ 39)
        d <- rpar (show . f $ 40)
        rseq a
        rseq b
        rseq c
        rseq d
        return (a, b, c, d)
  print result

