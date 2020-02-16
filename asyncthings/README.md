# Async Things

## Discover Async, High Perf Haskell P/270

see `src/HighPerf/Async` for concise demo using `race` combinator

The race combinator is not only more concise but quite a bit faster too;
Async relies on STM to provide the flexibility, but race can be (and is)
implemented using MVar and throwTo

### Composing with Concurrently type

P/271

> The magic of Concurrently lies in its Applicative, Alternative,
> and Monoid instances.

see `src/HighPerf/Concurrently.hs` for Applicative-Concurrent example;
this is more inspiring
