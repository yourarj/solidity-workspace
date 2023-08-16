# 09: Listening to events

- We can listen to events happening on blockchain with `web3js`
- e.g.
```javascript
    cryptoZombies.events.NewZombie()
    .on("data", function(event) {
        // logic to execute
    }).on("error", console.error);
```
- We need to specify how much to send in `wei`, not `Ether`.

## using INDEXED
- In order to filter events and only listen for changes related to the current user, our Solidity contract would have to use the `indexed` keyword

## Querying past EVENTs
- We can even query past events using `getPastEvents`, and use the filters `fromBlock` and `toBlock` to give Solidity a time range for the event logs.
- e.g.
```solidity
cryptoZombies.getPastEvents("NewZombie", { fromBlock: 0, toBlock: "latest" })
.then(function(events) {
  // `events` is an array of `event` objects that we can iterate, like we did above
  // This code will get us a list of every zombie that was ever created
});
``` 
- Because you can use this method to query the event logs since the beginning of time, this presents an interesting use case: `Using events as a cheaper form of storage`.
