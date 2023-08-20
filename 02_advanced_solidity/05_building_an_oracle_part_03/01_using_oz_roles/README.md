# Controlling access with Openzepplin AccessControl

To give contract users different roles we can utilize `openzepplin`

We can import it as `import "openzeppelin-solidity/contracts/access/AccessControl.sol";`

e.g.
```solidity
import "openzeppelin-solidity/contracts/access/AccessControl.sol";

contract EthPriceOracle is AccessControl {
    bytes32 public constant ROLE_OWNER = keccak256("ROLE_OWNER");
    bytes32 public constant ROLE_ORACLE = keccak256("ROLE_ORACLE");
}
