# Controlling access with Openzepplin Roles

To give contract users different roles we can utilize `openzepplin`

Openzepplin provides `Roles` library and type `Roles.Role`

We can import it as `import "openzeppelin-solidity/contracts/access/Roles.sol";`

e.g.
```solidity
import "openzeppelin-solidity/contracts/access/Roles.sol";

contract RoleEnabledContract {
  using Roles for Roles. Role

  // do your stuff here
}
```