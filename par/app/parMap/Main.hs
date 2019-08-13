
import           Control.Parallel.Strategies hiding (parMap)

parMap :: (a -> b) -> [a] -> Eval [b]
parMap _ [] = return []
parMap f (x:xs) = do
  b <- rpar (f x)
  bs <- parMap f xs
  return (b:bs)

f :: Int -> Int
f n | n <= 0 = 0
    | n == 1 = 1
    | otherwise = f (n - 1) + f (n - 2)

main :: IO ()
main = do
  let workloads = [36, 37, 38, 39, 40, 41, 40, 39, 38, 37, 40]
      results = runEval (parMap f workloads)
  print results
