# 08: Calling Payable functions

- We can send ether to `payable` function.
- We need to specify how much to send in `wei`, not `Ether`.

## WEI
- a `wei` is smallest sub-unit of `ether`
- `1 ether = 10^18 wei`
- `web3js` provides util function to convert ether to wei.
```solidity
    // This will convert 1 ETH to Wei
    web3js.utils.toWei("1");
```
