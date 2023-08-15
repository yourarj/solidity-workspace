# 09: LIBRARY

- A `library` is a special type of *contract* in Solidity.
- We can bind library function to a type with `using` directive
- e.g.
```solidity
    using SafeMath for uint256;

    uint256 a = 5;
    uint256 b = a.add(3); // 5 + 3 = 8
    uint256 c = a.mul(2); // 5 * 2 = 10
```