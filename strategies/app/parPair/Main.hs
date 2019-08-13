
import           Control.Parallel.Strategies hiding (parPair)

parPair :: Strategy (a, b)
parPair (a, b) = do
  a' <- rpar a
  b' <- rpar b
  return (a', b')

main :: IO ()
main = do
  print 1
