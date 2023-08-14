# 01: payable functions

- `payable` functions are special type of functions which can recieve `ether`.
- in `payable` functions `msg.value` represents the sent `ether`.
- e.g.
```solidity
    function getEther() external payable {
        
    }
```
