
import           Control.Parallel.Strategies hiding (parPair, using)

-- para and con haskell L956

-- L981 always evaluate to WHNF
-- L999
-- rpar :: a -> Eval a is equivalent to Strategy a
-- rpar is therefore the strategy for any type, with the effect
-- of starting the evaluation of its argument while the enclosing
-- Eval computation proceeds in parallel
-- rseq is also a strategy
parPair :: Strategy (a, b)
parPair (a, b) = do
  a' <- rpar a
  b' <- rpar b
  return (a', b')

using :: a -> Strategy a -> a
using n s = runEval (s n)

f :: Int -> Int
f n | n <= 0 = 0
    | n == 1 = 1
    | otherwise = f (n - 1) + f (n - 2)

main :: IO ()
main = do
  let tasks = (f 30, f 39)
      results = tasks `using` parPair
  print results
