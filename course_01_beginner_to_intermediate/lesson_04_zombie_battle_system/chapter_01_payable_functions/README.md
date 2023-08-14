# 12: payable functions

- `payable` functions are special type of functions which can recieve `ether`.
- in `payable` functions `msg.value` represents the sent `ether`.
- e.g.
```solidity
for (uint i = 1; i <= 10; i++) {
    // perform ops
}
```
