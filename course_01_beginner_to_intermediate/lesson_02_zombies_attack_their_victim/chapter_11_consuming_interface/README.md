# 11: consuming interface

## Interacting with other contracts

- With interface already defined
- Grab the contract address of Contract represented by inteface.
- Initialize `interface` with `address`
- e.g.

```solidity
contract KittyInterface {
  function getKitty(uint256 _id) external view returns (
    bool isGestating,
    bool isReady,
    uint256 cooldownIndex,
    uint256 nextActionAt,
    uint256 siringWithId,
    uint256 birthTime,
    uint256 matronId,
    uint256 sireId,
    uint256 generation,
    uint256 genes
  );

  address addressOfContract = 0x06012c8cf97BEaD5deAe237070F9587f8E7A266d;

  // instantiate interface
  KittyInterface kittyContract = KittyInterface(addressOfContract);

}
```