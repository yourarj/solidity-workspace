# 08: function modifiers in depth

- function modifier are declared just like regular function except they are prefixed with `modifier` instead of `function`
- modifiers enhance a function
- modifiers usually contain *cross cutting concern* of contract
- `_` (*underscore*) has special meaning in modifier. It represents function body content.
- we can define a function modifier as follows
```solidity
// A mapping to store a user's age:
mapping (uint => uint) public age;

// Require that this user be older than a certain age:
modifier olderThan(uint _age, uint _userId) {
  require (age[_userId] >= _age);
  _;
}

// Must be older than 16 to drive a car (in the US, at least)
function driveCar(uint _userId) public olderThan(16, _userId) {
  // Some function logic
}
```
