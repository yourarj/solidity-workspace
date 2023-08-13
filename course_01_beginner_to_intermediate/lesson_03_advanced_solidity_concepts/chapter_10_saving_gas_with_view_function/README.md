# 10: view functions

- `view` functions don't actually change anything on the blockchain – *they only read the data*
- **Note**: If a view function is called internally from another function in the same contract that is not a view function, it will still cost gas. This is because the other function creates a transaction on Ethereum, and will still need to be verified from every node. ***So view functions are only free when they're called externally***.