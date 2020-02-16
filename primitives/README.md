# Primitives

## High Perf Haskell P/251

### IORef

P/252

> IORef is always full, that is, there is always a value to be read
> without blocking.

see: `app/primitives/ioref`; let these two forked threads run for 5000
microseconds

> in Haskell, when the main thread exits, all child threads will die too.

### Light-weight Threads

> While our program was multi-threaded, we were actually running it in
> a single Operating System (OS) thread. The single-threaded Runtime
> System always uses just one OS thread, but features a scheduler of
> its own for light-weight threads.

Light-weight threads are cheaper than OS threads

> a smaller memory footprint, very cheap to create and destroy, and
> they share the same heap objects with other light-weight threads in
> the same Haskell program.
