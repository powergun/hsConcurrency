
import           Control.Parallel.Strategies hiding (parMap)

-- threadscope
-- para and con haskell L708
{-
install threadscope:
brew install gtk+ gtk-mac-integration
then download the prebuilt binary for mac os

1. in package.yaml, modify ghc-options:
      - -threaded
      - -rtsopts
      - -with-rtsopts=-N
      - -eventlog

2. run stack build
stack build --executable-profiling

3. execute the binary
.stack-work/dist/x86_64-osx/Cabal-2.4.0.1/build/par-map/par-map +RTS -l
NOTE -p will generate the prof file which can't be used here
-l will generate eventlog

4. open threadscope and open the eventlog file
-}

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

-- para and con haskell L770
-- ghc runtime system can tell us how many sparks are created

-- stack run par-map --rts-options -s

-- SPARKS: 14(2 converted, 0 overflowed, 0 dud, 0 GC'd, 12 fizzled)
-- they are all converted - that is, turned into real parallalism
-- at runtime

main :: IO ()
main = do
  let workloads = [10..20] ++ [35, 36, 37]
      results = runEval (parMap f workloads)
  print results
