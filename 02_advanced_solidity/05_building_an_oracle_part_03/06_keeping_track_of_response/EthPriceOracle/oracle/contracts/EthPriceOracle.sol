// SPDX-License-Identifier: MIT
pragma solidity 0.7.6;
import "openzeppelin-solidity/contracts/access/AccessControl.sol";
import "openzeppelin-solidity/contracts/math/SafeMath.sol";
import "./CallerContractInterface.sol";

contract EthPriceOracle is AccessControl {
    using SafeMath for uint;

    bytes32 public constant ROLE_OWNER = keccak256("ROLE_OWNER");
    bytes32 public constant ROLE_ORACLE = keccak256("ROLE_ORACLE");
    uint private randNonce = 0;
    uint private modulus = 1000;
    uint numOracles = 0;

    mapping(uint256 => bool) pendingRequests;

    struct Response {
        address oracleAddress;
        address callerAddress;
        uint256 ethPrice;
    }
    mapping(uint256 => Response[]) public requestIdToResponse;

    event GetLatestEthPriceEvent(address callerAddress, uint id);
    event SetLatestEthPriceEvent(uint256 ethPrice, address callerAddress);
    event AddOracleEvent(address oracleAddress);
    event RemoveOracleEvent(address oracleAddress);

    constructor(address _owner) {
        _setupRole(ROLE_OWNER, _owner);
        _setRoleAdmin(ROLE_ORACLE, ROLE_OWNER);
    }

    function addOracle(address _oracle) public {
        require(hasRole(ROLE_OWNER, msg.sender), "Not an Owner");
        require(!hasRole(ROLE_ORACLE, _oracle), "Already an Oracle!");
        grantRole(ROLE_ORACLE, _oracle);
        numOracles = numOracles.add(1);
        emit AddOracleEvent(_oracle);
    }

    function removeOracle(address _oracle) public {
        require(hasRole(ROLE_OWNER, msg.sender), "Not an Owner");
        require(hasRole(ROLE_ORACLE, _oracle), "Not an Oracle!");
        require(numOracles > 1, "Do not remove the last Oracle!");
        revokeRole(ROLE_ORACLE, _oracle);
        numOracles = numOracles.sub(1);
        emit RemoveOracleEvent(_oracle);
    }

    function getLatestEthPrice() public returns (uint256) {
        randNonce = randNonce.add(1);
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
        require(hasRole(ROLE_ORACLE, msg.sender), "Not an Oracle!");
        require(
            pendingRequests[_id],
            "This request is not in my pending list."
        );
        Response memory resp = Response(msg.sender, _callerAddress, _ethPrice);
        requestIdToResponse[_id].push(resp);

        delete pendingRequests[_id];
        CallerContractInterface callerContractInstance;
        callerContractInstance = CallerContractInterface(_callerAddress);
        callerContractInstance.callback(_ethPrice, _id);
        emit SetLatestEthPriceEvent(_ethPrice, _callerAddress);
    }
}
