// SPDX-License-Identifier: MIT
pragma solidity 0.7.6;
import "./EthPriceOracleInterface.sol";

contract CallerContract {
    EthPriceOracleInterface private oracleInstance;
    address private oracleAddress;

    function setOracleInstanceAddress(address _oracleInstanceAddress) public {
        oracleAddress = _oracleInstanceAddress;
        oracleInstance = EthPriceOracleInterface(oracleAddress);
    }
}
