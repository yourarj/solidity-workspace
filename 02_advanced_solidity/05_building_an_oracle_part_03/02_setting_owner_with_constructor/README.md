# Setting owner with constructor

Setup owner with _setupRole(ROLE_OWNER, _owner)

e.g.
```solidity
import "openzeppelin-solidity/contracts/access/AccessControl.sol";

contract RoleEnabledContract is AccessControl {
  
    constructor(address _owner) {
        _setupRole(ROLE_OWNER, _owner);
    }

  // do your stuff here
}
```