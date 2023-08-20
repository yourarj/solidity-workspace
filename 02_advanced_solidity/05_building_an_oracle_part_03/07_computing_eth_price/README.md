# Computing ETH price

Now as there might be more than one oracle processing request. They could fetch different prices.

We need to accomodate this change to calculate the ETH price which will be conveyed to caller.

And another important decision on how many repsonses from Oracles we consider sufficient to compute ETH price.