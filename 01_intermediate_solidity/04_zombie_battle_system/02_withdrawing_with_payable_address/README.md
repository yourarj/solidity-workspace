# 02: payable address

- As there are `payable` functions are special type of functions which can recieve `ether`, there are also payable `address` to which we can transfer the ether.
- e.g.
```solidity
    address payable _owner = address(uint160(owner()));
    _owner.transfer(address(this).balance);
```
