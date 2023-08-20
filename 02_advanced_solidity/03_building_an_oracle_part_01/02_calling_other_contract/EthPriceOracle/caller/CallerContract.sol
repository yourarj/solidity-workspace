// SPDX-License-Identifier: MIT
pragma solidity 0.7.6;

contract CallerContract {
    address private oracleAddress;

    function setOracleInstanceAddress(address _oracleInstanceAddress) public {
        oracleAddress = _oracleInstanceAddress;
    }
}
