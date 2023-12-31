// SPDX-License-Identifier: MIT
pragma solidity 0.7.6;
import "openzeppelin-solidity/contracts/access/AccessControl.sol";
import "./CallerContractInterface.sol";

contract EthPriceOracle is AccessControl {
    bytes32 public constant ROLE_OWNER = keccak256("ROLE_OWNER");
    bytes32 public constant ROLE_ORACLE = keccak256("ROLE_ORACLE");
    uint private randNonce = 0;
    uint private modulus = 1000;
    mapping(uint256 => bool) pendingRequests;
    event GetLatestEthPriceEvent(address callerAddress, uint id);
    event SetLatestEthPriceEvent(uint256 ethPrice, address callerAddress);
    event AddOracleEvent(address oracleAddress);

    constructor(address _owner) {
        _setupRole(ROLE_OWNER, _owner);
    }

    function addOracle(address _oracle) public {
        require(hasRole(ROLE_OWNER, msg.sender), "Not an Owner");
    }

    function getLatestEthPrice() public returns (uint256) {
        randNonce++;
        uint id = uint(
            keccak256(abi.encodePacked(block.timestamp, msg.sender, randNonce))
        ) % modulus;
        pendingRequests[id] = true;
        emit GetLatestEthPriceEvent(msg.sender, id);
        return id;
    }

    function setLatestEthPrice(
        uint256 _ethPrice,
        address _callerAddress,
        uint256 _id
    ) public {
        require(
            pendingRequests[_id],
            "This request is not in my pending list."
        );
        delete pendingRequests[_id];
        CallerContractInterface callerContractInstance;
        callerContractInstance = CallerContractInterface(_callerAddress);
        callerContractInstance.callback(_ethPrice, _id);
        emit SetLatestEthPriceEvent(_ethPrice, _callerAddress);
    }
}
