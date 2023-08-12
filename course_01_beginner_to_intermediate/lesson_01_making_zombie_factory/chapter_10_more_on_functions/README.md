## More on functions in solidity

- You can `return` from function
```sol
    string greeting = "What's up dog";
    function sayHello() public returns (string memory){
        return greeting;
    }
```
- We can specify function `modifiers`
    1. `pure`
    2. `view`
    3. `payable`