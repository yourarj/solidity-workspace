# Execution with setInterval and terminating application gracefully

Due to singlethreaded nature of nodeJs we are processing events in queue batch-wise

Start execution loop with setInterval. Business logic given inside will execute after every N specified milliseconds
e.g.

```javascript
setInterval(async () => {
  // doSomething will be executed after every SLEEP_INTERVAL milliseconds
 doSomething()
}, SLEEP_INTERVAL)
```

And for graceful shutdown of execution we will setup a callback which will be invoked on `SIGINT` is fired

e.g.
```javascript
process.on( 'SIGINT', () => {
 // Gracefully shut down the oracle
 })
```