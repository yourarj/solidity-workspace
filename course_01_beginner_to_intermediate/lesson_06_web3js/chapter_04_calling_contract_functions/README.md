# 04: Calling Contract methods

- With `Web3.js`, there are two ways to call contract fnctions
    1. `call`
    2. `send`

## call
- `call` is used for `view` and `pure` functions.
- It won't create a transaction on the blockchain.

## send
- `send` will create a transaction and change data on the blockchain.
- You'll need to use send for any functions that `aren't` *view* or *pure*.