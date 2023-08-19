# 04: gas

- It's means of paying for computing resources spent for execution contract method

## struct packing
- If you have multiple field inside a struct, using a smaller-sized (fulfilling for need) type when possible will allow Solidity to `pack` these variables together to take up less storage, hence less gas.
- e.g.
```solidity
struct NormalStruct {
  uint a;
  uint b;
  uint c;
}

struct MiniMe {
  uint32 a;
  uint32 b;
  uint c;
}

// `mini` will cost less gas than `normal` because of struct packing
NormalStruct normal = NormalStruct(10, 20, 30);
MiniMe mini = MiniMe(10, 20, 30); 
```

-You'll also want to cluster identical data types together (i.e. put them next to each other in the struct) so that Solidity can minimize the required storage space. For example, a struct with fields `uint c; uint32 a; uint32 b;` will cost less gas than a struct with fields `uint32 a; uint c; uint32 b;` because the `uint32`` fields are **clustered** together.

## function modifiers
- Modifiers can be used to change the behaviour of functions in a declarative way.
- For example, you can use a modifier to automatically check a condition prior to executing the function.