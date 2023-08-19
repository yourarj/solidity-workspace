## Function declarations

- function parameters can be passed by two types
    1. `By value`, which means that the Solidity compiler creates a new copy of the parameter's value and passes it to your function.
    2. `By reference`, which means that your function is called with a reference to the original variable
- while passing reference types to function, they need to specified data-location of the parameter
- Data location could be `memory`, `storage` or `calldata`