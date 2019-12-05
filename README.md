# Haskell Concurrency

source:

https://www.fpcomplete.com/blog/2017/06/readert-design-pattern

Note, this article is about the ReaderT design pattern, but it
shows that, using mutable ref has its advantages, such as solving
the concurreny data race problem; below is a quick example showing
such data race

```haskell
import Control.Concurrent.Async.Lifted
import Control.Monad.State.Strict

main :: IO ()
main = execStateT
    (concurrently (modify (+ 1)) (modify (+ 2)))
    4 >>= print
```
