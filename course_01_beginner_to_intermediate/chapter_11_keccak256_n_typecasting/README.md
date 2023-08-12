## keccak256 and typecasting

- `keccak256` is SHA256 variant
- it expects single param of type `bytes`
- to work with different types we need `typecast` them to a type
```solidity
uint a = 5;
uint8 b = uint8(a);
```